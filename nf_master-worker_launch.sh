#!/bin/bash
#SBATCH --job-name=nf-ubaruchel
#SBATCH --output=slurm_out.txt
#SBATCH --partition=master-worker
#SBATCH --ntasks=1
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=4000
#SBATCH --account=DBCDOBCAG


# Always add these two commands to your scripts when using a environment
eval "$(conda shell.bash hook)"
source $CONDA_PREFIX/etc/profile.d/mamba.sh

mamba activate env_nextflow_23.10

export NXF_EXECUTOR=slurm
export NXF_ANSI_LOG=false
export SINGULARITY_CACHEDIR="/data/scratch/DBC/UBCN/CANCDYN/ubaruchel/testing_nfcore/work/singularity"
export NXF_SINGULARITY_CACHEDIR="/data/scratch/DBC/UBCN/CANCDYN/ubaruchel/testing_nfcore/work/singularity"

nextflow run /data/scratch/DBC/UBCN/CANCDYN/ubaruchel/testing_nfcore/nf-core-testingnfcore/main.nf \
--input /data/scratch/DBC/UBCN/CANCDYN/ubaruchel/testing_nfcore/inputs/samplesheet.csv \
--outdir /data/scratch/DBC/UBCN/CANCDYN/ubaruchel/testing_nfcore/my-outdir \
-profile singularity \
-c /data/scratch/DBC/UBCN/CANCDYN/ubaruchel/testing_nfcore/nf-core-testingnfcore/conf/icr.config

# --input https://raw.githubusercontent.com/nf-core/test-datasets/viralrecon/samplesheet/samplesheet_test_illumina_amplicon.csv \