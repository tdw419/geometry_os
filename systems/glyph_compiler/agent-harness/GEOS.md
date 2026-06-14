# Agent Harness: Geometry OS Glyph Compiler (GEOS)

## Purpose

This harness provides a standardized interface for agents to interact with the Geometry OS Glyph Compiler. It enables the transition from human-designed shader languages (WGSL) to AI-evolved glyph programs that execute directly on GPU/bare metal.

## Operating Procedure: Glyph Evolution

### Phase 1: Intent Mapping
1. **Define high-level goal** (e.g., "Create a red circle with 60 FPS PAS stability").
2. **Translate to opcodes** using `OPCODES.md` as reference.
3. **Generate JSON program** structure for the `glyph_compiler`.

### Phase 2: Compilation & Verification
1. **Compile to SPIR-V** via `geos task compile`.
2. **Verify binary validity** (check magic number `0x07230203`).
3. **Execute on GPU** via `geos task execute` (wgpu backend).

### Phase 3: Feedback Loop
1. **Inspect output** (visual PAS score, performance metrics).
2. **Mutate program** via Evolution Daemon.
3. **Repeat** until goal is achieved with confidence > 0.95.

## Command Reference

| Command | Action | Output |
|---------|--------|--------|
| `geos task compile` | Compile JSON → SPIR-V | JSON metadata |
| `geos task execute` | Run SPIR-V on GPU | Execution status |
| `geos session save` | Persist current program | Session file |
| `geos repl` | Enter interactive evolution mode | Styled REPL |

## Intent → Glyph Mapping (Example)

| Intent | Glyph Sequence |
|--------|----------------|
| Store constant 1.0 | `MOV(1.0, 0, dst=0)` |
| Add two memory locations | `ADD_MEM(src1=0, src2=1, dst=2)` |
| Branch if zero | `JZ(dst=2, pc=target)` |
| Halt execution | `HALT()` |

*Note: Canonical opcodes are 200-227.*
