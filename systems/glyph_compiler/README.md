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

## Opcode Reference

See `OPCODES.md` for the complete opcode specification.

Source of truth: `apps/autoresearch/champion_shader.wgsl`

## Evolution Integration

The `glyph_evolution.py` module connects this compiler to the evolution daemon:

```python
from systems.evolution_daemon.glyph_evolution import evolve_glyph_program

best = evolve_glyph_program(seed_program, generations=100)
```

## Future: DRM/KMS Direct Execution (Phase 2)

After Phase 1 is complete, the next step is to bypass wgpu and execute SPIR-V directly via DRM:

1. Complete DRM device enumeration in `systems/infinite_map_rs/src/backend/drm/`
2. Implement SPIR-V → AMDGPU/Intel command buffer translation
3. DMA-BUF sharing with display

## Future: Bare Metal (Phase 4)

Ultimate goal: Geometry OS boots directly, no Linux.

1. UEFI bootloader
2. GPU initialization from PCI
3. Glyph substrate as native memory
