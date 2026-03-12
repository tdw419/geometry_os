#!/bin/bash

# GlyphStratum WASM Build Script
# Compiles the WebAssembly runtime from glyph programs

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_DIR="${SCRIPT_DIR}/wasm"

echo "Checking for emscripten..."

if ! command -v emcc &> /dev/null 2>&1; then
    echo "  emscripten not available. The pure JS fallback will be used instead."
    echo "  To build WASM, install emscripten: https://emscripten.org/docs/getting_started/"
    exit 0
fi

echo "Building WASM binary..."

# Create output directory
mkdir -p "${OUTPUT_DIR}"

# Compile WASM
emcc "${SCRIPT_DIR}/glyph_runtime.c" -o "${OUTPUT_DIR}/glyph_runtime.wasm" \
    -s EXPORTED_FUNCTIONS='[\
        _malloc,\
        _free,\
        _glyph_init,\
        _glyph_clear,\
        _glyph_reset,\
        _glyph_add,\
        _glyph_add_dep,\
        _glyph_make_int,\
        _glyph_make_float,\
        _glyph_make_bool,\
        _glyph_get_type,\
        _glyph_get_int,\
        _glyph_get_float,\
        _glyph_execute,\
        _glyph_get_result_glyph,\
        _glyph_get_result_value,\
        _glyph_get_count,\
        _glyph_get_id,\
        _glyph_get_stratum,\
        _glyph_get_opcode,\
        _glyph_is_executed\
    ]' \
    --no-entry \
    -s WASM=1 \
    -O2 \
    -s STANDALONE_WASM=1 \
    -s ALLOW_MEMORY_GROWTH=1

if [ -f "${OUTPUT_DIR}/glyph_runtime.wasm" ]; then
    echo "  WASM build completed: ${OUTPUT_DIR}/glyph_runtime.wasm"
    echo "  Size: $(stat -f "${OUTPUT_DIR}/glyph_runtime.wasm" | cut -d' ' -f1) bytes"
else
    echo "  WASM build failed"
    exit 1
fi
