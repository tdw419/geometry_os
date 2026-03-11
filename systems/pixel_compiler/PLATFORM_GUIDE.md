# PixelRTS Platform Guide

## Overview

PixelRTS Platform transforms .rts.png from a visual container into a **complete executable platform**. Write code in assembly, compile to visual bytecode, execute directly on GPU.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    PixelRTS Platform                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐     ┌──────────────┐     ┌────────────┐ │
│  │   vasm       │────▶│   .rts.png   │────▶│    ICR     │ │
│  │  Assembler   │     │ Visual Bytecode│    │  Runtime   │ │
│  └──────────────┘     └──────────────┘     └────────────┘ │
│        │                                          │        │
│        │                                          ▼        │
│  ┌─────▼────────┐                          ┌─────────────┐ │
│  │  vdisasm     │                          │  GPU/VRAM   │ │
│  │  Disassembler│                          │  Execution  │ │
│  └──────────────┘                          └─────────────┘ │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐ │
│  │              Visual Linking System                   │ │
│  │  ┌─────────┐    ┌─────────┐    ┌─────────────────┐  │ │
│  │  │ main    │    │ stdlib  │    │  user libs      │  │ │
│  │  │ .rts.png│    │.rts.png │    │  .rts.png       │  │ │
│  │  └────┬────┘    └────┬────┘    └────────┬────────┘  │ │
│  │       │              │                  │           │ │
│  │       └───────┬──────┴──────────────────┘           │ │
│  │               ▼                                     │ │
│  │        Texture Sampling (TEXTURE instruction)        │ │
│  └──────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

## Quick Start

### 1. Write Your First Program

Create `hello.vasm`:

```vasm
main:
    LOAD R0, 42      ; Load immediate 42 into R0
    RET R0           ; Return R0
```

### 2. Compile with vasm

```bash
cd systems/pixel_compiler
python3 build_stdlib.py  # Build standard library first

# Now compile your program
python3 -c "
from vasm import VisualAssembler
assembler = VisualAssembler()
assembler.compile(open('hello.vasm').read())
assembler.save_png('hello.rts.png')
"
```

### 3. Disassemble with vdisasm

```python
from vdisasm import VisualDisassembler
disassembler = VisualDisassembler()
instructions = disassembler.disassemble_file('hello.rts.png')
print(disassembler.format_assembly(instructions))
```

## vasm Reference

### Syntax

```
label:
    INSTRUCTION operands
    ; Comment
```

### Instructions

| Instruction | Operands | Description |
|-------------|----------|-------------|
| NOP | | No operation |
| LOAD | Rd, imm | Load immediate: Rd = imm |
| MOV | Rd, Rs | Move register: Rd = Rs |
| ADD | Rd, Rs | Add: Rd += Rs |
| SUB | Rd, Rs | Subtract: Rd -= Rs |
| MUL | Rd, Rs | Multiply: Rd *= Rs |
| DIV | Rd, Rs | Divide: Rd /= Rs |
| JMP | label | Unconditional jump |
| JZ | Rd, label | Jump if Rd == 0 |
| JNZ | Rd, label | Jump if Rd != 0 |
| CALL | Rd \| label | Call subroutine (register or label) |
| RET | Rd | Return (result in Rd) |
| TEXTURE | Rd, slot | Load from texture slot |
| SAMPLE | Rd, coord | Sample texture at coordinate |

### Compilation Modes

- **standard**: Raw opcode encoding (disassemblable)
- **code**: Semantic coloring for visual debugging (not directly disassemblable)

## Example Programs

### Fibonacci

```vasm
; Calculate Fibonacci(n)
; Input: R0 = n
; Output: R0 = Fib(n)

fib:
    LOAD R1, 0      ; a = 0
    LOAD R2, 1      ; b = 1
loop:
    JZ R0, done     ; if n == 0, exit
    MOV R3, R2      ; temp = b
    ADD R3, R1      ; temp = a + b
    MOV R1, R2      ; a = b
    MOV R2, R3      ; b = temp
    LOAD R3, 1
    SUB R0, R3      ; n--
    JMP loop
done:
    MOV R0, R1      ; return a
    RET R0
```

### Using stdlib

```vasm
; Import math_add from stdlib
main:
    LOAD R0, 5
    LOAD R1, 3
    TEXTURE R2, 0    ; Import function from texture slot 0
    CALL R2
    RET R0            ; Returns 8
```

### Loop Counter

```vasm
; Count from 0 to 9
main:
    LOAD R0, 0      ; counter = 0
    LOAD R1, 10     ; limit = 10
loop:
    JZ R1, done     ; if limit == 0, exit
    LOAD R2, 1
    SUB R1, R2      ; limit--
    ADD R0, R2      ; counter++
    JMP loop
done:
    RET R0          ; return counter (10)
```

## Visual Linking

### Creating a Library

```vasm
; mylib.vasm
exported_func:
    LOAD R0, 100
    ADD R0, R1
    RET R0
```

Compile with exports:
```python
from vasm import VisualAssembler
from visual_linker import VisualLinker

assembler = VisualAssembler()
assembler.compile(open('mylib.vasm').read())

linker = VisualLinker()
exports = [('exported_func', assembler.labels['exported_func'])]
pixels = linker.write_exports(assembler.encode_to_pixels(), exports)

# Save
from PIL import Image
Image.fromarray(pixels, 'RGBA').save('mylib.rts.png')
```

### Linking

```python
linked = linker.link('main.rts.png', {'mylib': 'mylib.rts.png'})
# Now main.rts.png can call functions from mylib via TEXTURE instruction
```

## Standard Library

The `stdlib.rts.png` provides these functions:

| Function | Description | Arguments | Return |
|----------|-------------|-----------|--------|
| math_add | Addition | R0, R1 | R0 + R1 |
| math_sub | Subtraction | R0, R1 | R0 - R1 |
| math_mul | Multiplication | R0, R1 | R0 * R1 |
| math_div | Division | R0, R1 | R0 / R1 |
| cmp_eq | Equality compare | R0, R1 | 1 if R0 == R1 else 0 |
| cmp_lt | Less than compare | R0, R1 | 1 if R0 < R1 else 0 |
| mem_copy | Memory copy | R0, R1, R2 | R0 (address) |
| mem_set | Memory set | R0, R1, R2 | R0 (address) |

### Building stdlib

```bash
cd systems/pixel_compiler
python3 build_stdlib.py
```

Output:
```
Built stdlib with 8 functions -> stdlib.rts.png
   math_add: @0x0000
   math_sub: @0x0002
   math_mul: @0x0004
   math_div: @0x0006
   cmp_eq: @0x0008
   cmp_lt: @0x000f
   mem_copy: @0x001b
   mem_set: @0x001c
```

## Visual ABI (Function Linking)

The top-left 64x64 region of every .rts.png encodes the public interface:

- **Row 0**: Function name hashes (CRC32) → Entry point addresses
- **Row 1-63**: Reserved for future metadata (type signatures, version, etc.)

Function entry points are encoded as:
- Red: Function hash byte 0
- Green: Function hash byte 1
- Blue: Entry address high byte
- Alpha: Entry address low byte

## Performance

| Operation | Time | Notes |
|-----------|------|-------|
| Compile (100 instructions) | <100ms | vasm |
| Upload to GPU | <50ms | 4KB texture |
| Execute (1000 instructions) | <10ms | Compute shader |
| Generate heatmap | +5ms | Atomic operations |

## Troubleshooting

### "Unknown opcode" error
- Check instruction mnemonic spelling
- Verify you're using PixelISA v1.0 opcodes only

### "Undefined label" error
- Ensure all label references are defined
- Check label spelling matches exactly (case-sensitive)

### CALL instruction parsing error
- Use `CALL R0` for register-indirect calls
- Use `CALL label` for direct calls

### Linking fails
- Verify library exports exist in Visual ABI header
- Check TEXTURE slot indices match linked libraries
- Ensure stdlib.rts.png is built first

### Disassembly shows "???" opcodes
- File may have been compiled with `mode='code'`
- Use `mode='standard'` for disassemblable output
- Code mode uses semantic coloring which modifies the opcode channel

## PixelISA v1.0 Specification

### Instruction Format

Each instruction is encoded as a single RGBA pixel:

| Channel | Bits | Purpose |
|---------|------|---------|
| Red (R) | 8    | Opcode |
| Green (G) | 8  | Destination Register or Operand 1 |
| Blue (B) | 8   | Source Register or Operand 2 |
| Alpha (A) | 8  | Immediate Value or Flags |

### Semantic Coloring (Code Mode)

When assembling with `--mode code`, opcodes are colored by category:

- **Control Flow** (JMP, JZ, CALL, RET): Red = 200-255
- **Arithmetic** (ADD, SUB, MUL, DIV): Red = 128-199
- **Memory** (LOAD, MOV, TEXTURE): Red = 50-127
- **Data** (NOP): Red = 0

## Testing

Run the integration tests:

```bash
pytest tests/integration/test_pixelrts_platform_e2e.py -v
```

Expected output:
```
tests/integration/test_pixelrts_platform_e2e.py::test_e2e_fibonacci_program PASSED
tests/integration/test_pixelrts_platform_e2e.py::test_e2e_linked_program PASSED
tests/integration/test_pixelrts_platform_e2e.py::test_e2e_code_mode_visual_structure PASSED
tests/integration/test_pixelrts_platform_e2e.py::test_e2e_math_functions PASSED
tests/integration/test_pixelrts_platform_e2e.py::test_e2e_comparison_functions PASSED
tests/integration/test_pixelrts_platform_e2e.py::test_e2e_round_trip_compilation PASSED
tests/integration/test_pixelrts_platform_e2e.py::test_e2e_visual_abi_exports PASSED
tests/integration/test_pixelrts_platform_e2e.py::test_e2e_label_resolution PASSED
============================== 8 passed in 0.07s ===============================
```

## Next Steps

1. **Explore stdlib.rts.png**: Standard math and comparison functions
2. **Write shaders**: Create GPU-accelerated PixelRTS programs
3. **Build libraries**: Share reusable .rts.png modules
4. **Visual debugging**: Use code mode for visual program inspection
5. **Texture linking**: Create complex multi-module programs

## The Image IS the Program

PixelRTS Platform embodies the principle that **the image IS the program**. Every pixel encodes an instruction, every texture coordinate is a program counter. The GPU executes the pixels directly from VRAM, making .rts.png a truly visual executable format.

---

**Version:** 1.0
**Last Updated:** 2026-02-08
**Components:** vasm, vdisasm, visual_linker, stdlib
