# PixelRTS Quick Start Guide

PixelRTS is a visual programming language where code is stored as executable images (.rts.png files).

## Installation

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
```

Requirements:
- Python 3.10+
- NumPy (`pip install numpy`)
- Pillow (`pip install pillow`)

## Your First Program

### Method 1: Using a Template

```bash
# List available templates
python3 -m vasm --list-templates

# Create new project from template
python3 -m vasm --init hello

# Edit the file
vim hello.vasm

# Compile
python3 -m vasm hello.vasm

# Run the output image
# (Use with GPU executor or visual debugger)
```

### Method 2: Write from Scratch

Create `hello.vasm`:
```vasm
; Hello World in PixelRTS
LOAD R0, 42   ; Load the answer
RET R0        ; Return it
```

Compile:
```bash
python3 -m vasm hello.vasm
```

This creates `hello.rts.png` - an executable image file!

## Development Workflow

### Watch Mode (Auto-Recompile)

```bash
python3 -m vasm program.vasm --watch
```

Now every time you save `program.vasm`, it automatically recompiles.

### Verify Round-Trip

```bash
python3 -m vasm program.vasm --verify
```

Compiles, then disassembles and compares to ensure correctness.

### Show Statistics

```bash
python3 -m vasm program.vasm --stats
```

Shows:
- Total instructions
- Opcode distribution
- Code density
- Output dimensions

## Assembly Syntax

### Registers

- `R0` to `R255` - General purpose registers
- `R254` - Scratch register (commonly used)

### Opcodes

| Mnemonic | Description | Example |
|----------|-------------|---------|
| NOP | No operation | `NOP` |
| LOAD Rd, imm | Load immediate | `LOAD R0, 42` |
| MOV Rd, Rs | Move register | `MOV R0, R1` |
| ADD Rd, Rs | Add | `ADD R0, R1` |
| SUB Rd, Rs | Subtract | `SUB R0, R1` |
| MUL Rd, Rs | Multiply | `MUL R0, R1` |
| DIV Rd, Rs | Divide | `DIV R0, R1` |
| JMP label | Jump | `JMP loop` |
| JZ Rd, label | Jump if zero | `JZ R0, end` |
| JNZ Rd, label | Jump if not zero | `JNZ R0, loop` |
| RET Rd | Return | `RET R0` |

### Control Flow

```vasm
; Loop example
LOAD R0, 10     ; Counter
LOAD R1, 0      ; Accumulator

loop:
    ADD R1, 5   ; Add 5 to accumulator
    SUB R0, 1   ; Decrement counter
    JNZ R0, loop ; Continue if not zero

RET R1          ; Return result
```

### Functions

```vasm
; Function call example
LOAD R0, 10
CALL myfunc
RET R0

myfunc:
    ADD R0, 1
    RET R0
```

## PaintCode IDE

For a visual development experience:

```bash
python3 -m paintcode
```

Features:
- Real-time compilation
- Visual preview of generated image
- Load/save .rts.png files
- Export assembly source

## Examples

### Fibonacci

```bash
python3 -m vasm --init fibonacci --template fibonacci
```

### Counter Loop

```bash
python3 -m vasm --init counter --template counter
```

## Tips

1. **Use --watch during development** - Saves time on recompilation
2. **Use --verify before committing** - Ensures round-trip correctness
3. **Use --stats to optimize** - See which opcodes you use most
4. **Start from templates** - Don't write from scratch
5. **Use the linter** - `python3 linter.py program.vasm`

## Next Steps

- Read the full PixelISA specification
- Try the visual debugger: `python3 -m gpu_executor program.rts.png`
- Explore the standard library
- Contribute examples!

## Troubleshooting

### "Module not found" error
```bash
pip install numpy pillow
```

### "Invalid register" error
Check that register numbers are 0-255: `R0` to `R255`

### "Undefined label" error
Ensure all jump targets are defined as `label:`

### Linter warnings
```bash
python3 linter.py program.vasm
```

Use the linter to catch issues before compiling.
