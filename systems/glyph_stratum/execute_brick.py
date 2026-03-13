#!/usr/bin/env python3
"""
Geometry OS - Brick Executor
Execute glyph programs from .rts.png bricks directly on GPU
"""

import wgpu
import numpy as np
from PIL import Image
from pathlib import Path
import sys

SHADER_PATH = Path(__file__).parent.parent / "visual_shell/web/shaders/glyph_brain.wgsl"

def load_brick(brick_path: Path) -> np.ndarray:
    """Load a .rts.png brick into texture data."""
    img = Image.open(brick_path)
    return np.array(img, dtype=np.uint8)

def execute_brick(brick_path: Path, program_offset: tuple = (0, 0), program_size: int = 64) -> dict:
    """
    Execute a program from a brick on the GPU.

    Args:
        brick_path: Path to .rts.png brick
        program_offset: (x, y) offset in the brick where program starts
        program_size: Size of program texture to extract

    Returns:
        dict with execution results
    """
    print(f"[BrickExecutor] Loading: {brick_path}")

    # Load brick
    brick_data = load_brick(brick_path)
    print(f"  Brick size: {brick_data.shape}")

    # Extract program region
    x, y = program_offset
    program_texture = brick_data[y:y+program_size, x:x+program_size].copy()
    if program_texture.shape[0] < program_size or program_texture.shape[1] < program_size:
        # Pad if needed
        padded = np.zeros((program_size, program_size, 4), dtype=np.uint8)
        padded[:program_texture.shape[0], :program_texture.shape[1]] = program_texture
        program_texture = np.ascontiguousarray(padded)
    else:
        program_texture = np.ascontiguousarray(program_texture)

    # Initialize GPU
    adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
    device = adapter.request_device()

    with open(SHADER_PATH, "r") as f:
        shader_code = f.read()

    shader_module = device.create_shader_module(code=shader_code)

    # Create texture
    glyph_texture = device.create_texture(
        size=(program_size, program_size, 1),
        usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
        format=wgpu.TextureFormat.rgba8unorm,
    )
    device.queue.write_texture(
        {"texture": glyph_texture, "origin": (0, 0, 0), "mip_level": 0},
        program_texture,
        {"bytes_per_row": program_size * 4, "rows_per_image": program_size},
        (program_size, program_size, 1),
    )

    # State buffer (32 registers + PC + halted + cycle + padding)
    state_buffer = device.create_buffer(
        size=36 * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
    )

    # Memory buffer
    memory_buffer = device.create_buffer(
        size=16384 * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
    )

    # Output texture
    output_texture = device.create_texture(
        size=(64, 64, 1),
        usage=wgpu.TextureUsage.STORAGE_BINDING | wgpu.TextureUsage.COPY_SRC,
        format=wgpu.TextureFormat.rgba8unorm,
    )

    # Pipeline
    compute_pipeline = device.create_compute_pipeline(
        layout="auto",
        compute={"module": shader_module, "entry_point": "main"},
    )

    # Bind group
    bind_group = device.create_bind_group(
        layout=compute_pipeline.get_bind_group_layout(0),
        entries=[
            {"binding": 0, "resource": glyph_texture.create_view()},
            {"binding": 1, "resource": {"buffer": state_buffer, "offset": 0, "size": state_buffer.size}},
            {"binding": 2, "resource": {"buffer": memory_buffer, "offset": 0, "size": memory_buffer.size}},
            {"binding": 3, "resource": output_texture.create_view()},
        ],
    )

    # Execute
    print("  Executing...")
    import time
    start = time.perf_counter()

    encoder = device.create_command_encoder()
    pass_enc = encoder.begin_compute_pass()
    pass_enc.set_pipeline(compute_pipeline)
    pass_enc.set_bind_group(0, bind_group)
    pass_enc.dispatch_workgroups(1)
    pass_enc.end()
    device.queue.submit([encoder.finish()])
    device.queue.on_submitted_work_done()

    elapsed = time.perf_counter() - start

    # Read results
    state_out = np.frombuffer(device.queue.read_buffer(state_buffer), dtype=np.uint32)
    memory_out = np.frombuffer(device.queue.read_buffer(memory_buffer), dtype=np.uint32)

    result = {
        "elapsed_ms": elapsed * 1000,
        "registers": state_out[:8].tolist(),
        "memory": memory_out[:16].tolist(),
        "r0": int(state_out[0]),
        "r1": int(state_out[1]),
        "r2": int(state_out[2]),
        "pc": int(state_out[32]),
        "halted": bool(state_out[33]),
        "cycles": int(state_out[34]),
    }

    print(f"  Completed in {result['elapsed_ms']:.2f}ms")
    print(f"  Registers: r0={result['r0']}, r1={result['r1']}, r2={result['r2']}")
    print(f"  PC: {result['pc']}, Halted: {result['halted']}, Cycles: {result['cycles']}")

    return result

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 execute_brick.py <brick.rts.png> [offset_x offset_y]")
        print("\nExample offsets in mini_os.rts.png (256x256):")
        print("  (0,0)   - factorial")
        print("  (64,0)  - counter")
        print("  (128,0) - swarm_draw")
        print("  (0,64)  - mutant_1")
        print("  (64,64) - mutant_5")
        print("  (128,64)- mutant_15")
        print("  (0,128) - explore_18")
        sys.exit(1)

    brick_path = Path(sys.argv[1])
    offset_x = int(sys.argv[2]) if len(sys.argv) > 2 else 0
    offset_y = int(sys.argv[3]) if len(sys.argv) > 3 else 0

    result = execute_brick(brick_path, (offset_x, offset_y))
    print("\nResult:", result)

if __name__ == "__main__":
    main()
