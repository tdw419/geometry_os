#!/bin/bash
# geos-riscv-load.sh - Load RISC-V binary into GPU daemon
#
# Usage: ./geos-riscv-load.sh <binary.elf> [entry_point]
#
# 1. Extracts .text section from ELF
# 2. Converts to raw bytes at offset 0x8000
# 3. Loads emulator.glyph first
# 4. Injects binary via daemon HTTP API

set -e

BINARY="$1"
ENTRY="${2:-0x8000}"
DAEMON_URL="${GEOS_DAEMON_URL:-http://127.0.0.1:8769}"
EMULATOR_PATH="systems/glyph_stratum/programs/riscv_emulator.rts.png"

if [[ -z "$BINARY" ]]; then
    echo "Usage: $0 <binary.elf> [entry_point]"
    exit 1
fi

# Check if daemon is running
if ! curl -s "$DAEMON_URL/status" > /dev/null 2>&1; then
    echo "Error: GPU daemon not running at $DAEMON_URL"
    exit 1
fi

echo "Daemon is running."

# Check for required tools
if ! command -v riscv64-unknown-elf-objcopy &> /dev/null; then
    echo "Error: riscv64-unknown-elf-objcopy not found. Please install RISC-V toolchain."
    exit 1
fi

# Extract raw binary from ELF
TMP_BIN=$(mktemp)
trap "rm -f $TMP_BIN" EXIT

echo "Extracting raw binary from $BINARY..."
riscv64-unknown-elf-objcopy -O binary "$BINARY" "$TMP_BIN"
BINARY_SIZE=$(stat -c%s "$TMP_BIN")
echo "Binary size: $BINARY_SIZE bytes"

# Load emulator glyph if it exists
if [[ -f "$EMULATOR_PATH" ]]; then
    echo "Loading RISC-V emulator from $EMULATOR_PATH..."
    # Note: The daemon doesn't have a /load endpoint yet, so this is a placeholder
    # In the future, this would load the emulator into the substrate
    echo "Warning: Emulator loading not yet implemented - daemon needs /load endpoint"
else
    echo "Warning: Emulator not found at $EMULATOR_PATH"
fi

# Inject binary at guest RAM offset using /poke endpoint
# This writes 4 bytes at a time to address 0x8000 and beyond
echo "Loading binary $BINARY at offset 0x8000..."

# Read binary and poke each 4-byte word
OFFSET=0
BYTES_REMAINING=$BINARY_SIZE

while [[ $BYTES_REMAINING -gt 0 ]]; do
    # Read 4 bytes (or less for last chunk)
    if [[ $BYTES_REMAINING -ge 4 ]]; then
        CHUNK_SIZE=4
    else
        CHUNK_SIZE=$BYTES_REMAINING
    fi

    # Read bytes and convert to little-endian 32-bit value
    VALUE=0
    for ((i=0; i<CHUNK_SIZE; i++)); do
        BYTE=$(xxd -s $OFFSET -l 1 -p "$TMP_BIN" 2>/dev/null)
        VALUE=$((VALUE | (0x$BYTE << (i * 8))))
    done

    ADDR=$((0x8000 + OFFSET / 4))

    # Use /poke endpoint to write value
    curl -s "$DAEMON_URL/poke?addr=0x$ADDR&value=0x$VALUE" > /dev/null

    OFFSET=$((OFFSET + CHUNK_SIZE))
    BYTES_REMAINING=$((BYTES_REMAINING - CHUNK_SIZE))

    # Progress indicator every 256 bytes
    if [[ $((OFFSET % 256)) -eq 0 ]]; then
        echo "  Written $OFFSET / $BINARY_SIZE bytes..."
    fi
done

echo "Binary loaded: $OFFSET bytes written to substrate."

# Set entry point at address 0x14000 (GUEST_PC location)
echo "Setting entry point to $ENTRY..."
# Parse entry point (remove 0x prefix if present)
ENTRY_VAL="${ENTRY#0x}"
curl -s "$DAEMON_URL/poke?addr=0x14000&value=0x$ENTRY_VAL" > /dev/null

echo "Done. Binary loaded and ready to execute."
echo "Entry point: $ENTRY written to GUEST_PC (0x14000)"
