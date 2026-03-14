#!/usr/bin/env python3
"""
Glyph VM Terminal Visual Demo
Shows the glyph VMs executing in real-time in the terminal.
Uses ANSI colors to represent VM states.
"""

import sys
import time
import numpy as np
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

# ANSI color codes
COLORS = {
    'reset': '\033[0m',
    'green': '\033[92m',   # Correct
    'cyan': '\033[96m',    # Computing
    'blue': '\033[94m',    # Low value
    'yellow': '\033[93m',  # Medium
    'red': '\033[91m',     # High
    'gray': '\033[90m',    # Idle/zero
    'bold': '\033[1m',
}

def run_terminal_demo():
    try:
        import wgpu
    except ImportError as e:
        return {"status": "FAIL", "error": f"wgpu not installed: {e}"}

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

    # Create program buffer
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

    # Create state buffer (64K VMs)
    num_vms = 65536
    state_size_u32 = 12
    state_data = np.zeros(num_vms * state_size_u32, dtype=np.uint32)
    for i in range(num_vms):
        base = i * state_size_u32
        state_data[base + 1] = 5
        state_data[base + 2] = 1
        state_data[base + 3] = 1

    state_buffer = device.create_buffer(
        size=state_data.nbytes,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC,
    )
    device.queue.write_buffer(state_buffer, 0, state_data.tobytes())

    results_buffer = device.create_buffer(
        size=num_vms * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC,
    )

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

    # Terminal display settings
    term_width = 80
    term_height = 20
    grid_size = 256

    print("\033[2J\033[H")  # Clear screen
    print(f"{COLORS['bold']}{'='*60}{COLORS['reset']}")
    print(f"{COLORS['bold']}  GEOMETRY OS - GLYPH VM TERMINAL VISUAL{COLORS['reset']}")
    print(f"{COLORS['bold']}{'='*60}{COLORS['reset']}")
    print()
    print("Press Ctrl+C to exit")
    print()

    frame = 0
    gips_samples = []

    try:
        while True:
            start_time = time.time()

            # Run GPU compute
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

            # Calculate GIPS
            instructions_per_frame = 42 * num_vms
            gips = (instructions_per_frame / elapsed) / 1_000_000_000 if elapsed > 0 else 0
            gips_samples.append(gips)
            if len(gips_samples) > 10:
                gips_samples.pop(0)
            avg_gips = sum(gips_samples) / len(gips_samples)

            # Count correct results
            correct = np.sum(result_data == 120)
            correct_pct = correct / num_vms * 100

            # Move cursor to display area
            print(f"\033[8;0H")  # Move to row 8

            # Display header
            print(f"{COLORS['bold']}VMs: {num_vms:,}  |  GIPS: {avg_gips:.2f}  |  Correct: {correct:,} ({correct_pct:.1f}%){COLORS['reset']}")
            print()

            # Sample grid for display
            step = grid_size // term_height
            display_grid = []
            for y in range(0, grid_size, step):
                row = []
                for x in range(0, grid_size, step * 3):  # Wider step for width
                    idx = y * grid_size + x
                    if idx < len(result_data):
                        val = result_data[idx]
                        if val == 120:
                            row.append(f"{COLORS['green']}█{COLORS['reset']}")
                        elif val > 100:
                            row.append(f"{COLORS['cyan']}▓{COLORS['reset']}")
                        elif val > 50:
                            row.append(f"{COLORS['yellow']}▒{COLORS['reset']}")
                        elif val > 0:
                            row.append(f"{COLORS['blue']}░{COLORS['reset']}")
                        else:
                            row.append(f"{COLORS['gray']}·{COLORS['reset']}")
                    else:
                        row.append(" ")
                display_grid.append("".join(row[:term_width]))

            # Print grid
            for row in display_grid:
                print(row)

            # Legend
            print()
            print(f"{COLORS['green']}█{COLORS['reset']} Correct(120)  {COLORS['cyan']}▓{COLORS['reset']} >100  {COLORS['yellow']}▒{COLORS['reset']} >50  {COLORS['blue']}░{COLORS['reset']} >0  {COLORS['gray']}·{COLORS['reset']} Idle")
            print(f"Frame: {frame}  |  FPS: {1/elapsed:.1f}")

            frame += 1

            # Reset VMs periodically
            if frame % 50 == 0:
                state_data = np.zeros(num_vms * state_size_u32, dtype=np.uint32)
                for i in range(num_vms):
                    base = i * state_size_u32
                    state_data[base + 1] = 5
                    state_data[base + 2] = 1
                    state_data[base + 3] = 1
                device.queue.write_buffer(state_buffer, 0, state_data.tobytes())

            time.sleep(0.1)  # 10 FPS

    except KeyboardInterrupt:
        print(f"\n{COLORS['reset']}\nDemo stopped by user")

    return {"status": "PASS", "frames": frame, "avg_gips": avg_gips}

def main():
    result = run_terminal_demo()
    if "error" in result:
        print(f"Error: {result['error']}")
        sys.exit(1)
    print(f"\nDemo complete: {result.get('frames', 0)} frames, {result.get('avg_gips', 0):.2f} GIPS")

if __name__ == "__main__":
    main()
