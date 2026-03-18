# Glyph Stratum - Pixel Programs

This directory contains Glyph assembly programs and tools.

## Quick Start

```bash
# Run a Glyph program (no Rust needed!)
python3 glyph_vm.py --asm "LDI r0, 42; HALT"

# Run a .glyph file
python3 glyph_vm.py programs/hello.glyph
```

## Files

| File | Description |
|------|-------------|
| `glyph_vm.py` | Pure Python Glyph VM runner |
| `programs/*.glyph` | Example Glyph programs |
| `compile_glyph.py` | Compiler for GPU (.glyph → .png) |

## Documentation

See [docs/PYTHON_GLYPH_VM.md](../../docs/PYTHON_GLYPH_VM.md) for full documentation.

## Philosophy

> "Pixels Move Pixels"

Glyph is a programming language where each instruction is a pixel. No abstractions, just direct spatial computation.
