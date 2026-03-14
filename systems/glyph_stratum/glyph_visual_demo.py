#!/usr/bin/env python3
"""
Glyph VM Visual Demo
Shows the glyph VMs executing in real-time on screen.
Each pixel represents a VM's execution state.
"""

import sys
import time
import numpy as np
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

def run_visual_demo():
    try:
        import wgpu
        import pygame
    except ImportError as e:
        return {"status": "FAIL", "error": f"Missing dependency: {e}"}

    # Initialize Pygame
    pygame.init()
    width, height = 1024, 768
    screen = pygame.display.set_mode((width, height))
    pygame.display.set_caption("Geometry OS - Glyph VM Visual")
    clock = pygame.time.Clock()
    font = pygame.font.SysFont('monospace', 16)

    # Initialize GPU
    try:
        adapter = wgpu.gpu.request_adapter_sync(power_preference="high-performance")
        device = adapter.request_device_sync()
    except Exception as e:
        return {"status": "FAIL", "error": str(e)}

    # Load parallel shader
    shader_path = ROOT / "systems" / "glyph_stratum" / "glyph_parallel_benchmark.wgsl"
    with open(shader_path, "r") as f:
        shader_code = f.read()

    try:
        shader_module = device.create_shader_module(code=shader_code)
    except Exception as e:
        return {"status": "FAIL", "error": f"Shader: {e}"}

    # Create program buffer (factorial program)
    OP_DATA, OP_MUL, OP_SUB, OP_BNZ, OP_HALT = 14, 7, 6, 209, 255
    instructions = [
        [OP_DATA, 1, 5, 0],
        [OP_DATA, 2, 1, 0],
        [OP_DATA, 3, 1, 0],
        [OP_MUL, 1, 2, 2],
        [OP_SUB, 1, 3, 1],
        [OP_BNZ, 1, 3, 0],
        [OP_HALT, 0, 0, 0],
    ]

    program_data = []
    for inst in instructions:
        program_data.extend(inst)
    while len(program_data) < 1024:
        program_data.append(0)

    program_buffer = device.create_buffer(
        size=len(program_data) * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST,
    )
    device.queue.write_buffer(program_buffer, 0, np.array(program_data, dtype=np.uint32).tobytes())

    # Create state buffer for VMs (64K VMs for visualization)
    num_vms = 65536  # 256x256 grid
    state_size_u32 = 12
    state_data = np.zeros(num_vms * state_size_u32, dtype=np.uint32)
    for i in range(num_vms):
        base = i * state_size_u32
        state_data[base + 1] = 5   # r1 = 5
        state_data[base + 2] = 1   # r2 = 1
        state_data[base + 3] = 1   # r3 = 1

    state_buffer = device.create_buffer(
        size=state_data.nbytes,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC,
    )
    device.queue.write_buffer(state_buffer, 0, state_data.tobytes())

    # Results buffer
    results_buffer = device.create_buffer(
        size=num_vms * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC,
    )

    # Pipeline
    pipeline = device.create_compute_pipeline(
        layout="auto",
        compute={"module": shader_module, "entry_point": "main"},
    )

    bind_group = device.create_bind_group(
        layout=pipeline.get_bind_group_layout(0),
        entries=[
            {"binding": 0, "resource": {"buffer": program_buffer, "offset": 0, "size": program_buffer.size}},
            {"binding": 1, "resource": {"buffer": state_buffer, "offset": 0, "size": state_buffer.size}},
            {"binding": 2, "resource": {"buffer": results_buffer, "offset": 0, "size": results_buffer.size}},
        ],
    )

    # Main loop
    grid_size = 256
    cell_size = min(width // grid_size, height // grid_size)
    offset_x = (width - grid_size * cell_size) // 2
    offset_y = (height - grid_size * cell_size) // 2

    running = True
    frame = 0
    total_gips = 0
    gips_samples = []

    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE:
                    running = False

        # Run GPU compute
        start_time = time.time()
        encoder = device.create_command_encoder()
        pass_enc = encoder.begin_compute_pass()
        pass_enc.set_pipeline(pipeline)
        pass_enc.set_bind_group(0, bind_group)
        pass_enc.dispatch_workgroups((num_vms + 255) // 256)
        pass_enc.end()
        device.queue.submit([encoder.finish()])

        # Read results
        result_data = np.frombuffer(device.queue.read_buffer(results_buffer), dtype=np.uint32)
        elapsed = time.time() - start_time

        # Calculate GIPS (42 instructions per VM)
        instructions_per_frame = 42 * num_vms
        gips = (instructions_per_frame / elapsed) / 1_000_000_000 if elapsed > 0 else 0
        gips_samples.append(gips)
        if len(gips_samples) > 30:
            gips_samples.pop(0)
        avg_gips = sum(gips_samples) / len(gips_samples)

        # Render VM grid
        screen.fill((10, 10, 15))

        # Create surface from results
        grid_surface = pygame.Surface((grid_size, grid_size))
        for y in range(grid_size):
            for x in range(grid_size):
                idx = y * grid_size + x
                result = result_data[idx]
                # Color based on result value
                if result == 120:  # Correct factorial result
                    color = (0, 255, 100)  # Green
                elif result > 0:
                    # Gradient from blue to cyan based on value
                    intensity = min(255, result * 2)
                    color = (0, intensity, 255)
                else:
                    color = (40, 40, 50)  # Dark gray
                grid_surface.set_at((x, y), color)

        # Scale and blit
        scaled = pygame.transform.scale(grid_surface, (grid_size * cell_size, grid_size * cell_size))
        screen.blit(scaled, (offset_x, offset_y))

        # Draw border
        pygame.draw.rect(screen, (0, 255, 255),
                        (offset_x - 2, offset_y - 2,
                         grid_size * cell_size + 4, grid_size * cell_size + 4), 2)

        # Draw stats
        stats = [
            f"GEOMETRY OS - Glyph VM Visual",
            f"",
            f"VMs: {num_vms:,} ({grid_size}x{grid_size})",
            f"GIPS: {avg_gips:.2f}",
            f"FPS: {clock.get_fps():.1f}",
            f"Frame: {frame}",
            f"",
            f"Green = Correct (120)",
            f"Blue = Computing",
            f"Gray = Idle",
        ]

        y_pos = 20
        for line in stats:
            text = font.render(line, True, (200, 200, 200))
            screen.blit(text, (20, y_pos))
            y_pos += 20

        pygame.display.flip()
        clock.tick(60)
        frame += 1

        # Reset VMs every 100 frames
        if frame % 100 == 0:
            state_data = np.zeros(num_vms * state_size_u32, dtype=np.uint32)
            for i in range(num_vms):
                base = i * state_size_u32
                state_data[base + 1] = 5
                state_data[base + 2] = 1
                state_data[base + 3] = 1
            device.queue.write_buffer(state_buffer, 0, state_data.tobytes())

    pygame.quit()
    return {"status": "PASS", "frames": frame, "avg_gips": avg_gips}

def main():
    print("=" * 60)
    print(" GEOMETRY OS - GLYPH VM VISUAL DEMO")
    print("=" * 60)
    print()
    print("Press ESC or close window to exit")
    print()

    result = run_visual_demo()

    if "error" in result:
        print(f"Error: {result['error']}")
        sys.exit(1)

    print(f"Demo complete: {result.get('frames', 0)} frames, {result.get('avg_gips', 0):.2f} GIPS")
    sys.exit(0)

if __name__ == "__main__":
    main()
