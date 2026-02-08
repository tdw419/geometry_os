#!/bin/bash
set -e

GENOME_DIR="${1:-data/genomes}"
OUTPUT_DIR="${2:-geometry_os/vectorland/src/generated}"

echo "Building genome-generated code..."

# Generate Rust code
python3 systems/genome/integration/build.py \
    --genome-dir "$GENOME_DIR" \
    --output-dir "$OUTPUT_DIR"

# Add generated module to Cargo.toml if not present
CARGO_TOML="geometry_os/vectorland/Cargo.toml"
if ! grep -q "generated" "$CARGO_TOML"; then
    echo "" >> "$CARGO_TOML"
    echo "# Auto-generated from genomes" >> "$CARGO_TOML"
    echo "generated = { optional = true, path = \"src/generated\" }" >> "$CARGO_TOML"
    echo "Added generated dependency to Cargo.toml"
fi

echo "Build complete"
