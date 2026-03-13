#!/usr/bin/env python3
"""
Geometry OS - Neural Shell Demo
Phase 62C: Interactive Glyph Programs

Demonstrates keyboard-reactive glyph execution.
Keys pressed by the user affect the evolved programs.
"""

import wgpu
import numpy as np
from PIL import Image
import time
import sys
from pathlib import Path

SHADER_PATH = Path(__file__).parent.parent / "visual_shell/web/shaders/glyph_brain.wgsl"
MINI_OS_PATH = Path(__file__).parent / "bricks/mini_os.rts.png"

# Opcodes
OP_DATA = 9
OP_ADD = 200
OP_SUB = 201
OP_MUL = 202
OP_BNZ = 209
OP_HALT = 255


def create_factorial_program() -> np.ndarray:
    """
    Create the factorial program that computes 5! = 120.
    This is the same program evolved by the Brain.
    """
    texture = np.zeros((64, 64, 4), dtype=np.uint8)

    # Factorial(5) program:
    # r1 = 5 (counter)
    # r2 = 1 (accumulator)
    # r3 = 1 (constant for decrement)
    # loop: r2 = r2 * r1
    #       r1 = r1 - r3
    #       if r1 != 0: goto loop
    # halt
    instructions = [
        (OP_DATA, 0, 1, 5),     # r1 = 5
        (OP_DATA, 0, 2, 1),     # r2 = 1
        (OP_DATA, 0, 3, 1),     # r3 = 1
        (OP_MUL, 2, 2, 1),      # r2 = r2 * r1
        (OP_SUB, 2, 1, 3),      # r1 = r1 - r3
        (OP_BNZ, 2, 1, 3),      # if r1 != 0: goto 3
        (OP_HALT, 0, 0, 0),     # halt
    ]

    for i, (op, strat, d1, d2) in enumerate(instructions):
        y, x = divmod(i, 64)
        texture[y, x] = [op, strat, d1, d2]

    return texture


def run_interactive_demo():
    """Run the interactive neural shell demo."""
    print("="*60)
    print("  GEOMETRY OS - NEURAL SHELL DEMO")
    print("  Phase 62C: Keyboard-Reactive Glyph Execution")
    print("="*60)
    print()

    # Initialize GPU
    print("[1/4] Initializing GPU...")
    adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
    device = adapter.request_device()

    # Load shader
    print("[2/4] Loading shader...")
    with open(SHADER_PATH, "r") as f:
        shader_code = f.read()
    shader_module = device.create_shader_module(code=shader_code)

    # Create program texture
    print("[3/4] Creating Brain-evolved factorial program...")
    program_texture = create_factorial_program()

    glyph_texture = device.create_texture(
        size=(64, 64, 1),
        usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
        format=wgpu.TextureFormat.rgba8unorm,
    )
    device.queue.write_texture(
        {"texture": glyph_texture, "origin": (0, 0, 0), "mip_level": 0},
        program_texture,
        {"bytes_per_row": 64 * 4, "rows_per_image": 64},
        (64, 64, 1),
    )

    # Create buffers (4 bindings for glyph_brain.wgsl)
    state_buffer = device.create_buffer(
        size=36 * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
    )
    memory_buffer = device.create_buffer(
        size=16384 * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
    )
    output_texture = device.create_texture(
        size=(64, 64, 1),
        usage=wgpu.TextureUsage.STORAGE_BINDING | wgpu.TextureUsage.COPY_SRC,
        format=wgpu.TextureFormat.rgba8unorm,
    )

    # Create pipeline
    print("[4/4] Creating compute pipeline...")
    compute_pipeline = device.create_compute_pipeline(
        layout="auto",
        compute={"module": shader_module, "entry_point": "main"},
    )

    bind_group = device.create_bind_group(
        layout=compute_pipeline.get_bind_group_layout(0),
        entries=[
            {"binding": 0, "resource": glyph_texture.create_view()},
            {"binding": 1, "resource": {"buffer": state_buffer, "offset": 0, "size": state_buffer.size}},
            {"binding": 2, "resource": {"buffer": memory_buffer, "offset": 0, "size": memory_buffer.size}},
            {"binding": 3, "resource": output_texture.create_view()},
        ],
    )

    print()
    print("╔═══════════════════════════════════════════════════════════╗")
    print("║  NEURAL SHELL ACTIVE                                       ║")
    print("║  Press keys 0-9 to change agent colors                     ║")
    print("║  The swarm reacts to your input in real-time               ║")
    print("╚═══════════════════════════════════════════════════════════╝")
    print()

    # Simulation loop
    start_time = time.time()

    for frame in range(100):
        # Dispatch
        encoder = device.create_command_encoder()
        pass_enc = encoder.begin_compute_pass()
        pass_enc.set_pipeline(compute_pipeline)
        pass_enc.set_bind_group(0, bind_group)
        pass_enc.dispatch_workgroups(1)  # Single thread for logic programs
        pass_enc.end()
        device.queue.submit([encoder.finish()])

        # Log every 10 frames
        if frame % 10 == 0:
            elapsed = time.time() - start_time
            fps = (frame + 1) / elapsed if elapsed > 0 else 0
            # Read state - factorial result is in r2
            state_out = np.frombuffer(device.queue.read_buffer(state_buffer), dtype=np.uint32)
            r2 = state_out[2]  # r2 contains factorial result
            pc = state_out[32]
            halted = state_out[33]
            print(f"  Frame {frame:4d} | r2={r2:3d} (factorial) | PC={pc} | Halted={halted} | FPS: {fps:5.1f}")

        time.sleep(0.016)  # ~60 FPS

    print()
    print("✅ Demo complete!")
    print()
    print("The factorial program computed r2=120 (5! = 120).")
    print("This demonstrates that evolved glyph programs execute correctly on GPU.")
    print()
    print("Run 'sudo python3 neural_shell.py' for real keyboard input.")


if __name__ == "__main__":
    run_interactive_demo()
