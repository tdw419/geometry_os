#!/bin/bash
# GlyphStratum WASM Build Script
# ================================
# Compiles the C runtime to WebAssembly using emscripten

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_DIR="${SCRIPT_DIR}"

echo "=========================================="
echo "GlyphStratum WASM Build"
echo "=========================================="

# Check for emscripten
if ! command -v emcc &> /dev/null 2>&1; then
    echo ""
    echo "❌ Emscripten not found!"
    echo ""
    echo "To install emscripten, run:"
    echo ""
    echo "  # Option 1: Using emsdk (recommended)"
    echo "  git clone https://github.com/emscripten-core/emsdk.git"
    echo "  cd emsdk"
    echo "  ./emsdk install latest"
    echo "  ./emsdk activate latest"
    echo "  source ./emsdk_env.sh"
    echo ""
    echo "  # Option 2: Using conda"
    echo "  conda install -c conda-forge emscripten"
    echo ""
    echo "  # Option 3: Using npm"
    echo "  npm install -g emscripten"
    echo ""
    echo "After installation, reload your shell or add emscripten to PATH."
    echo ""
    echo "Falling back to pure JS runtime (no WASM optimization)."
    exit 0
fi

echo ""
echo "✓ Emscripten found: $(emcc --version | head -1)"
echo ""

# Create output directory
mkdir -p "${OUTPUT_DIR}"

# Compile to WASM
echo "Building WASM binary..."
echo ""

emcc "${SCRIPT_DIR}/glyph_runtime.c" \
    -o "${OUTPUT_DIR}/glyph_runtime.js" \
    -s EXPORTED_FUNCTIONS='[
        _malloc,
        _free,
        _glyph_init,
        _glyph_clear,
        _glyph_reset,
        _glyph_add,
        _glyph_add_dep,
        _glyph_make_int,
        _glyph_make_float,
        _glyph_make_bool,
        _glyph_get_type,
        _glyph_get_int,
        _glyph_get_float,
        _glyph_execute,
        _glyph_get_result_glyph,
        _glyph_get_result_value,
        _glyph_get_count,
        _glyph_get_id,
        _glyph_get_stratum,
        _glyph_get_opcode,
        _glyph_is_executed
    ]' \
    --no-entry \
    -s WASM=1 \
    -O2 \
    -s MODULARIZE=1 \
    -s EXPORT_ES6=1 \
    -s ALLOW_MEMORY_GROWTH=1

if [ -f "${OUTPUT_DIR}/glyph_runtime.js" ]; then
    WASM_SIZE=$(stat -c%s "${OUTPUT_DIR}/glyph_runtime.wasm" 2>/dev/null | cut -d' ' -f1)

    echo "=========================================="
    echo "✓ WASM build successful!"
    echo "=========================================="
    echo ""
    echo "Output files:"
    echo "  - ${OUTPUT_DIR}/glyph_runtime.js    (JavaScript glue code)"
    echo "  - ${OUTPUT_DIR}/glyph_runtime.wasm  (WebAssembly binary)"
    echo ""
    echo "Size: ${WASM_SIZE} bytes"
    echo ""
    echo "Usage:"
    echo "  const Module = require('./glyph_runtime.js');"
    echo "  Module().then(instance => {"
    echo "    const runtime = instance;"
    echo "    // Call exported functions..."
    echo "  });"
else
    echo "=========================================="
    echo "✗ WASM build failed!"
    echo "=========================================="
    exit 1
fi
