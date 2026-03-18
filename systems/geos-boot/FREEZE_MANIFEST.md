# ❄️ Geos-Boot Freeze Manifest

**Date:** _To be filled on freeze_
**Commit:** _To be filled on freeze_

## CPU Responsibilities (FROZEN)

These responsibilities will NEVER change after freeze:

1. **Windowing** - winit window creation and event loop
2. **WebGPU Init** - Surface, adapter, device creation
3. **Event Forwarding** - Mouse/keyboard → GPU mailbox at 0x200
4. **Program Loading** - .glyph files → GPU memory at 0x1000

## GPU Responsibilities (EVOLVING)

All future features go here:

- VM opcode execution
- Self-modifying code
- Visual rendering
- Text display
- UI components
- File system (via CPU requests)

## I/O Contract v1.0

| Offset | Size | Purpose |
|--------|------|---------|
| 0x0000 | 512 | VM State (PC, cycle, registers) |
| 0x0200 | 256 | Mailbox (CPU→GPU commands) |
| 0x0300 | 1024 | Event Buffer |
| 0x1000 | 1MB | Glyph Program Memory |

## The Vow

> I will never again modify `src/*.rs` without explicit unfreeze ceremony.
> If I need a feature, I will implement it in WGSL.
> The CPU is dead. Long live the GPU.

## Unfreeze Ceremony

To modify frozen code:

1. Create `UNFREEZE_REQUEST.md` with justification
2. Wait 24 hours
3. Get explicit approval
4. Document changes in `FREEZE_CHANGELOG.md`
