# Glyph Compiler

Compiles AI-evolved glyph programs directly to SPIR-V, bypassing WGSL.

## Architecture

```
Glyph Program (JSON)
        ↓
  spirv_mapping.rs   ← Maps opcodes 200-227 to SPIR-V ops
        ↓
  binary_builder.rs  ← Generates valid SPIR-V binary
        ↓
  executor.rs        ← Executes via wgpu (Phase 1)
```

## Usage

```bash
# Compile a glyph program
echo '{"glyphs": [{"opcode": 206, "p1": 42.0, "p2": 0.0, "dst": 0}]}' | \
  cargo run --package glyph_compiler -- compile

# Output:
# {"spirv_size":80,"word_count":20,"magic":"0x07230203"}
```

## DRM/KMS Execution (Phase 2)

Execute glyph programs directly via DRM/KMS without X11 or Wayland:

```bash
# Compile and execute via DRM
echo '{"glyphs": [{"opcode": 206, "p1": 42.0, "p2": 0.0, "dst": 0}]}' | \
  cargo run --package glyph_compiler --features drm -- execute --drm

# Output:
# {"drm":true,"magic":"0x07230203","spirv_size":80,"status":"compiled_for_drm","word_count":20}
```

### Architecture

```
Glyph Program (JSON)
        ↓
  glyph_compiler compile → SPIR-V binary
        ↓
  DrmGlyphExecutor → wgpu compute pipeline
        ↓
  DrmRenderer → GBM buffer + KMS scanout
        ↓
  Display (direct to screen)
```

### Requirements

- Linux kernel with DRM/KMS support
- `/dev/dri/cardX` device access (may need udev rules)
- GPU with compute shader support

### Integration with infinite_map_rs

The `DrmGlyphExecutor` is integrated into `DrmRenderer`:

```rust
use infinite_map_rs::backend::drm::{DrmRenderer, DrmGlyphExecutor};

// Access glyph executor from renderer
if let Some(executor) = renderer.get_glyph_executor() {
    executor.load_spirv(&spirv_binary)?;
    let output = executor.execute(&inputs, (width, height))?;
}
```

## Opcode Reference

See `OPCODES.md` for the complete opcode specification.

Source of truth: `apps/autoresearch/champion_shader.wgsl`

## Evolution Integration

The `glyph_evolution.py` module connects this compiler to the evolution daemon:

```python
from systems.evolution_daemon.glyph_evolution import evolve_glyph_program

best = evolve_glyph_program(seed_program, generations=100)
```

## Future: Bare Metal (Phase 4)

Ultimate goal: Geometry OS boots directly, no Linux.

1. UEFI bootloader
2. GPU initialization from PCI
3. Glyph substrate as native memory
