# PixelRTS Quick Start Guide

Get started with PixelRTS Platform in 5 minutes.

## What is PixelRTS?

PixelRTS is a visual executable format where **the image IS the program**. Assembly code is compiled to RGBA pixel bytecode and executed directly on GPU.

## Prerequisites

- Python 3.12+
- Pillow (PNG handling)
- NumPy (pixel arrays)

```bash
pip install pillow numpy
```

## 30-Second Example

### 1. Create a Program

```bash
cat > hello.vasm << 'EOF'
main:
    LOAD R0, 42
    RET R0
EOF
```

### 2. Compile to .rts.png

```python
from systems.pixel_compiler.vasm import VisualAssembler

assembler = VisualAssembler()
assembler.compile(open('hello.vasm').read())
assembler.save_png('hello.rts.png')
```

### 3. Verify Output

```python
from systems.pixel_compiler.vdisasm import VisualDisassembler
from PIL import Image

# Load and display
img = Image.open('hello.rts.png')
print(f"Size: {img.size}")  # 2x2 pixels
print(f"Mode: {img.mode}")  # RGBA

# Disassemble
disassembler = VisualDisassembler()
instructions = disassembler.disassemble_file('hello.rts.png')
print(disassembler.format_assembly(instructions))
# Output:
# LOAD R0, 42
# RET R0
```

## Common Patterns

### Fibonacci in One Minute

```vasm
; fib.vasm - Calculate Fibonacci(10)
main:
    LOAD R0, 0      ; a = 0
    LOAD R1, 1      ; b = 1
    LOAD R2, 10     ; n = 10
loop:
    JZ R2, done
    MOV R3, R1
    ADD R3, R0      ; temp = a + b
    MOV R0, R1
    MOV R1, R3
    LOAD R3, 1
    SUB R2, R3
    JMP loop
done:
    RET R0          ; Returns 55 (Fib(10))
```

Compile:
```python
from systems.pixel_compiler.vasm import VisualAssembler
assembler = VisualAssembler()
assembler.compile(open('fib.vasm').read())
assembler.save_png('fib.rts.png')
```

### Using Standard Library

```bash
# Build stdlib first
cd systems/pixel_compiler
python3 build_stdlib.py
```

```vasm
; add.vasm - Use stdlib math_add
main:
    LOAD R0, 5
    LOAD R1, 3
    TEXTURE R2, 0    ; Import from slot 0
    CALL R2
    RET R0           ; Returns 8
```

## File Reference

| File | Purpose |
|------|---------|
| `vasm.py` | Visual Assembler - compiles .vasm to .rts.png |
| `vdisasm.py` | Visual Disassembler - converts .rts.png to assembly |
| `visual_linker.py` | Visual Linker - links multiple .rts.png files |
| `stdlib.vasm` | Standard library source |
| `stdlib.rts.png` | Compiled standard library |
| `build_stdlib.py` | Builds stdlib.rts.png |

## Instruction Cheatsheet

| Instruction | Example | Description |
|-------------|---------|-------------|
| LOAD | `LOAD R0, 42` | Load immediate |
| MOV | `MOV R0, R1` | Copy register |
| ADD | `ADD R0, R1` | Add registers |
| SUB | `SUB R0, R1` | Subtract registers |
| JMP | `JMP loop` | Jump to label |
| JZ | `JZ R0, done` | Jump if zero |
| CALL | `CALL R0` | Call subroutine |
| RET | `RET R0` | Return |

## Modes

### Standard Mode (Default)
```python
assembler.save_png('output.rts.png', mode='standard')
```
- Raw opcode encoding
- Fully disassemblable
- Use for distribution

### Code Mode
```python
assembler.save_png('output.rts.png', mode='code')
```
- Semantic coloring
- Visual debugging
- Not directly disassemblable

## Testing

Run all tests:
```bash
pytest tests/integration/test_pixelrts_platform_e2e.py -v
```

Quick test:
```bash
python3 -c "
from systems.pixel_compiler.vasm import VisualAssembler
from systems.pixel_compiler.vdisasm import VisualDisassembler

asm = VisualAssembler()
asm.compile('main:\nLOAD R0, 42\nRET R0')
asm.save_png('/tmp/test.rts.png')

dis = VisualDisassembler()
inst = dis.disassemble_file('/tmp/test.rts.png')
print(f'Instructions: {len(inst)}')
print(dis.format_assembly(inst))
"
```

## Troubleshooting

**Problem:** `ImportError: No module named 'vasm'`
**Solution:** Make sure you're in the project root and use:
```python
from systems.pixel_compiler.vasm import VisualAssembler
```

**Problem:** "Unknown opcode" error
**Solution:** Check instruction spelling against the cheatsheet above

**Problem:** Disassembly shows "????"
**Solution:** File was compiled with `mode='code'`. Use `mode='standard'` for disassemblable output.

## PixelRTS v2 - Visual Containers

PixelRTS v2 is the next-generation format that stores binaries as viewable PNG images with RGBA dense packing and Hilbert curve mapping.

### Convert to Visual Format

```bash
# Convert binary to PNG
python3 pixelrts_v2_converter.py kernel.bin kernel.rts.png

# With boot script
python3 pixelrts_v2_converter.py alpine.rts alpine.rts.png \
  --generate-boot-script

# WASM module with semantic coloring
python3 pixelrts_v2_converter.py module.wasm module.rts.png \
  --mode code
```

### Extract from Visual Format

```bash
# Extract back to binary
python3 pixelrts_v2_extractor.py kernel.rts.png -o kernel.bin

# With verification
python3 pixelrts_v2_extractor.py kernel.rts.png --verify

# Show metadata only
python3 pixelrts_v2_extractor.py kernel.rts.png --info
```

### Use with Existing Tools

PixelRTS v2 integrates seamlessly with the RTS registry and tooling:

```bash
# Register in RTS catalog
python3 rts_registry_manager.py register kernel.rts.png

# List all cartridges
python3 rts_registry_manager.py list

# Find specific cartridges
python3 rts_registry_manager.py find "kernel"

# Verify integrity
python3 rts_registry_manager.py verify kernel-id
```

### Key Features

- **4 bytes/pixel RGBA dense packing** - 100% data density
- **Hilbert space-filling curve mapping** - Locality preservation
- **PNG tEXt chunk metadata** - Embedded + sidecar JSON
- **SHA256 hash verification** - Guaranteed lossless
- **Standard + Code (WASM) modes** - Generic and semantic visualization
- **Automatic boot script generation** - QEMU/KVM integration
- **RTS registry integration** - Centralized catalog management

### Capacity Examples

| Grid Size | Capacity | Max File Size |
|-----------|----------|---------------|
| 512×512   | 1 MB     | 1,048,576 bytes |
| 1024×1024 | 4 MB     | 4,194,304 bytes |
| 2048×2048 | 16 MB    | 16,777,216 bytes |
| 4096×4096 | 64 MB    | 67,108,864 bytes |

For complete PixelRTS v2 documentation, see [PIXELRTS_V2.md](PIXELRTS_V2.md).

## Next Steps

- Read [PLATFORM_GUIDE.md](PLATFORM_GUIDE.md) for full documentation
- Check [stdlib.vasm](stdlib.vasm) for standard library functions
- See [PIXELRTS_V2.md](PIXELRTS_V2.md) for PixelRTS v2 format details
- Run `pytest tests/` for more examples

## The Philosophy

> **The image IS the program.**

PixelRTS embodies visual computing: programs are images, execution is texture sampling, and the GPU runs your pixels directly from VRAM. Welcome to the future of visual executables.

PixelRTS v2 extends this philosophy with high-density visual containers that can store any binary data - kernels, OS images, WASM modules, or arbitrary files - as viewable PNG images.

---

**Quick. Simple. Visual.**
