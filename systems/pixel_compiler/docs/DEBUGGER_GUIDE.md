# PixelRTS Visual Debugger Guide

## Overview

The PixelRTS Visual Debugger allows you to execute programs on the GPU and visualize their execution in real-time. It provides:

- **GPU Execution**: Run PixelRTS programs on hardware-accelerated WebGPU compute shaders
- **Execution Tracing**: Capture every instruction execution with PC, opcode, and operands
- **Heatmaps**: Visualize which parts of your program execute most frequently
- **Timeline Analysis**: See program counter and opcode distribution over time
- **IDE Integration**: Debug controls built into PaintCode IDE

---

## Quick Start

### Command Line Usage

```bash
# Navigate to pixel_compiler directory
cd systems/pixel_compiler

# Execute a program and generate trace JSON
python3 -m pixelrts_trace program.rts.png --output trace.json

# Generate execution heatmap
python3 -m pixelrts_trace program.rts.png --heatmap heatmap.png

# Interactive matplotlib visualization
python3 -m pixelrts_trace program.rts.png --view

# Combined: trace + heatmap + view
python3 -m pixelrts_trace program.rts.png \
    --output trace.json \
    --heatmap heatmap.png \
    --view
```

### IDE Usage (PaintCode)

1. **Launch the IDE**:
   ```bash
   python3 paintcode.py
   ```

2. **Write or load your program** in the assembly editor

3. **Click "Compile"** to build the visual representation

4. **Click "▶ Run"** to execute on GPU
   - Status bar shows execution summary
   - Debug buttons become enabled

5. **Click "Step"** to single-step through execution
   - Yellow highlight shows current instruction
   - Status bar shows PC and register values

6. **Click "Trace"** to see full execution visualization
   - Timeline shows PC over time
   - Heatmap shows execution frequency

7. **Click "Heatmap"** to save heatmap image

---

## Features

### 1. GPU Execution (`gpu_executor.py`)

The `GPUExecutor` class manages GPU program execution:

```python
from gpu_executor import GPUExecutor
import numpy as np
from PIL import Image

# Load program
img = Image.open('program.rts.png')
pixels = np.array(img)

# Execute on GPU
executor = GPUExecutor()
executor.load_program(pixels)
result = executor.run()

# Access results
print(f"Instructions: {result.steps}")
print(f"Registers: {result.registers}")
print(f"Trace entries: {len(result.trace)}")
print(f"Heatmap shape: {result.heatmap.shape}")
```

**Features:**
- Automatic shader compilation from `pixel_vm_debug.wgsl`
- SSBO-backed register file (256 float registers)
- Trace buffer with 10,000 entry capacity
- Storage texture heatmap generation

### 2. Trace Visualization (`trace_viewer.py`)

The `TraceVisualizer` class provides multiple visualization modes:

```python
from trace_viewer import TraceVisualizer, TraceEntry

viz = TraceVisualizer()

# Generate heatmap (2D array of execution counts)
heatmap = viz.render_heatmap(trace_entries, program_shape=(height, width))

# Create matplotlib heatmap figure
fig = viz.plot_heatmap(trace_entries, program_shape)
fig.savefig('heatmap.png')

# Render timeline (PC and opcode over time)
fig = viz.render_timeline(trace_entries)

# Export/import JSON
viz.export_json(trace_entries, 'trace.json')
loaded = viz.load_json('trace.json')

# Create animation
anim = viz.create_animation(trace_entries, program_image)
anim.save('execution.mp4', writer='ffmpeg', fps=10)
```

**TraceEntry Properties:**
```python
@dataclass
class TraceEntry:
    pc: int           # Program counter
    opcode: int       # Opcode value
    dest: int         # Destination register
    src: int          # Source register
    immediate: int    # Immediate value

    @property
    def opcode_name(self) -> str:
        # Human-readable opcode: 'LOAD', 'ADD', 'RET', etc.
```

### 3. CLI Tool (`pixelrts_trace.py`)

Full-featured command-line interface:

```bash
python3 -m pixelrts_trace program.rts.png [OPTIONS]

Options:
  --output FILE     Save trace as JSON
  --heatmap FILE    Generate heatmap image
  --view            Show interactive matplotlib view
  --max-steps N     Maximum execution steps (default: 1000)
  --help            Show help message
```

---

## Architecture

### GPU Pipeline

```
┌─────────────────────────────────────────────────────────────┐
│                        Python Host                           │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │ GPUExecutor  │  │TraceVisualizer│  │     CLI     │     │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘     │
│         │                 │                 │               │
└─────────┼─────────────────┼─────────────────┼───────────────┘
          │                 │                 │
          ▼                 ▼                 ▼
┌─────────────────────────────────────────────────────────────┐
│                      WebGPU (wgpu-native)                    │
│  ┌──────────────────────────────────────────────────────┐  │
│  │           pixel_vm_debug.wgsl (Compute Shader)       │  │
│  │                                                       │  │
│  │  - Fetch instruction from texture                    │  │
│  │  - Decode RGBA to opcode/operands                    │  │
│  │  - Execute switch(opcode)                            │  │
│  │  - Write to trace buffer                             │  │
│  │  - Update heatmap texture                            │  │
│  └──────────────────────────────────────────────────────┘  │
│           │                        │                        │
│           ▼                        ▼                        │
│  ┌────────────────┐      ┌────────────────┐               │
│  │ Texture (Code) │      │  SSBO (Trace)  │               │
│  └────────────────┘      └────────────────┘               │
└─────────────────────────────────────────────────────────────┘
```

### Shader Bindings

| Binding | Type | Purpose |
|---------|------|---------|
| 0 | texture_2d | Program code (input) |
| 1 | storage_buffer | Registers (R0-R255) |
| 2 | storage_buffer | Trace buffer (5 u32s per entry) |
| 3 | storage_texture | Heatmap (rgba8unorm) |

### Trace Format

Each trace entry is 5 uint32s (20 bytes):

```c
struct TraceEntry {
    u32 pc;         // Program counter
    u32 opcode;     // Opcode value
    u32 dest;       // Destination register
    u32 src;        // Source register
    u32 immediate;  // Immediate value
};
```

---

## Examples

### Example 1: Simple Counter

```assembly
; counter.vasm
LOAD R0, 5       ; Initialize counter
LOAD R1, 0       ; Initialize accumulator

loop:
    ADD R1, 1     ; Increment accumulator
    SUB R0, 1     ; Decrement counter
    JNZ R0, loop  ; Continue if not zero

RET R1           ; Return result (should be 5)
```

**Trace:**
```bash
python3 -m pixelrts_trace counter.rts.png --view
```

**Expected Result:** R1 = 5.0

### Example 2: Fibonacci Sequence

```assembly
; fibonacci.vasm
LOAD R0, 10      ; n = 10
LOAD R1, 0       ; a = 0
LOAD R2, 1       ; b = 1
LOAD R3, 0       ; temp

fib_loop:
    JZ R0, fib_done

    ; temp = a + b
    MOV R3, R1
    ADD R3, R2

    ; Shift: a = b, b = temp
    MOV R1, R2
    MOV R2, R3

    ; Decrement
    LOAD R4, 1
    SUB R0, R4

    JMP fib_loop

fib_done:
    RET R1          ; Return fib(10) = 55
```

**Trace:**
```bash
python3 -m pixelrts_trace fibonacci.rts.png --output fib_trace.json --heatmap fib_heatmap.png
```

**Expected Result:** R1 = 55.0

See `examples/debugging/fibonacci_debug.vasm` for the complete example.

---

## Opcodes Reference

| Opcode | Name | Description | Color |
|--------|------|-------------|-------|
| 0 | NOP | No operation | Black |
| 10 | LOAD | Load immediate | Blue |
| 11 | MOV | Move register | Blue |
| 100 | ADD | Add registers | Orange |
| 101 | SUB | Subtract | Orange |
| 102 | MUL | Multiply | Orange |
| 103 | DIV | Divide | Orange |
| 200 | JMP | Unconditional jump | Red |
| 201 | JZ | Jump if zero | Red |
| 202 | JNZ | Jump if not zero | Red |
| 210 | CALL | Call function | Red |
| 211 | RET | Return | Red |

---

## Troubleshooting

### "wgpu not installed"

Install WebGPU Python bindings:
```bash
pip install wgpu
```

### "GPU execution failed"

1. Check that your system supports WebGPU
2. Verify `pixel_vm_debug.wgsl` exists in `systems/pixel_compiler/`
3. Try reducing `--max-steps` for simpler programs

### Empty trace

- Verify your program has a `RET` instruction
- Check that program isn't in infinite loop (use `--max-steps`)
- Ensure program PNG is valid RGBA format

### Heatmap is all black

- Program may have executed only once per instruction
- Try running a loop-heavy program to see variation
- Check heatmap scale in matplotlib viewer

---

## Performance

- **Trace capacity:** 10,000 entries (configurable)
- **Max steps:** 1,000 default (adjustable)
- **Typical execution:** <100ms for small programs
- **Heatmap generation:** O(n) where n = trace length

---

## API Reference

### GPUExecutor

```python
class GPUExecutor:
    def __init__(self, max_trace_entries: int = 10000)
    def load_program(self, pixels: np.ndarray) -> None
    def load_program_from_png(self, filepath: str) -> None
    def run(self, max_steps: int = 1000) -> ExecutionResult
```

### ExecutionResult

```python
@dataclass
class ExecutionResult:
    registers: np.ndarray  # Shape: (256,)
    steps: int
    trace: List[dict]
    heatmap: np.ndarray    # Shape: (height, width)
```

### TraceVisualizer

```python
class TraceVisualizer:
    def render_heatmap(self, trace: List[TraceEntry], program_shape: Tuple[int, int]) -> np.ndarray
    def plot_heatmap(self, trace: List[TraceEntry], program_shape: Tuple[int, int]) -> Figure
    def render_timeline(self, trace: List[TraceEntry]) -> Figure
    def export_json(self, trace: List[TraceEntry], filepath: str) -> None
    def load_json(self, filepath: str) -> List[TraceEntry]
    def create_animation(self, trace: List[TraceEntry], program_image: np.ndarray) -> Animation
```

---

## See Also

- **PixelISA Specification:** `docs/PIXELISA.md`
- **Assembler Guide:** `vasm.py --help`
- **Disassembler Guide:** `vdisasm.py --help`
- **IDE Usage:** `paintcode.py`

---

**Version:** 1.0
**Date:** 2026-02-08
**Platform:** Linux, macOS, Windows (with WebGPU support)
