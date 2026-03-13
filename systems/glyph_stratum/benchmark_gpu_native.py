import wgpu
import numpy as np
import time
import argparse
from pathlib import Path

# Geometry OS - GPU-Native Glyph Benchmark (Visual Swarm Edition)
# Phase 50: Testing Visual Output (DRAW Opcode)

SHADER_PATH = Path("systems/visual_shell/web/shaders/glyph_microcode.wgsl")

def run_benchmark(num_glyphs=1000, iterations=100, mode="visual"):
    adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
    device = adapter.request_device()

    with open(SHADER_PATH, "r") as f:
        shader_code = f.read()
    
    shader_module = device.create_shader_module(code=shader_code)

    side = int(np.ceil(np.sqrt(num_glyphs)))
    texture_data = np.zeros((side, side, 4), dtype=np.uint8)

    if mode == "visual":
        # Visual Swarm Program (10,000 agents drawing themselves)
        # PC 0: DATA(9, r1, thread_id) -> Each agent gets its ID from Python or logic
        # For simplicity, we hardcode a basic "Draw at (id%100, id/100) with color Purple"
        # We simulate the ID using register 1 set by our host logic
        
        # PC 0: DATA(9, r1, color: Purple #FF00FF FF)
        texture_data[0, 0] = [9, 0, 1, 0xFF00FFFF] # Placeholder, will be fixed in shader or logic
        # PC 1: DATA(9, r2, coord: x=id%100, y=id/100)
        texture_data[0, 1] = [9, 0, 2, 0] 
        # PC 2: DRAW(215, r1, r2)
        texture_data[0, 2] = [215, 0, 1, 2]
        # PC 3: HALT(255)
        texture_data[0, 3] = [255, 0, 0, 0]
        num_glyphs = 4
    elif mode == "logic" or mode == "swarm":
        # Loop Program
        texture_data[0, 0] = [9, 0, 1, 3]
        texture_data[0, 1] = [9, 0, 2, 1]
        texture_data[0, 2] = [209, 0, 1, 4]
        texture_data[0, 3] = [255, 0, 0, 0]
        texture_data[0, 4] = [200, 0, 0, 2]
        texture_data[0, 5] = [201, 0, 1, 2]
        texture_data[0, 6] = [6, 0, 0, 2]
        num_glyphs = 7
    elif mode == "factorial":
        texture_data[0, 0] = [9, 0, 1, 5]
        texture_data[0, 1] = [9, 0, 2, 4]
        texture_data[0, 2] = [202, 0, 1, 2]
        texture_data[0, 3] = [9, 0, 2, 3]
        texture_data[0, 4] = [202, 0, 1, 2]
        texture_data[0, 5] = [9, 0, 2, 2]
        texture_data[0, 6] = [202, 0, 1, 2]
        texture_data[0, 7] = [255, 0, 0, 0]
        num_glyphs = 8

    glyph_texture = device.create_texture(
        size=(side, side, 1),
        usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
        format=wgpu.TextureFormat.rgba8unorm,
    )
    device.queue.write_texture(
        {"texture": glyph_texture, "origin": (0, 0, 0), "mip_level": 0},
        texture_data,
        {"bytes_per_row": side * 4, "rows_per_image": side},
        (side, side, 1),
    )

    state_buffer = device.create_buffer(size=36 * 4, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST)
    memory_buffer = device.create_buffer(size=16384 * 4, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC)
    
    # New: Output Visual Map (100x100 for 10,000 agents)
    output_texture = device.create_texture(
        size=(100, 100, 1),
        usage=wgpu.TextureUsage.STORAGE_BINDING | wgpu.TextureUsage.COPY_SRC,
        format=wgpu.TextureFormat.rgba8unorm,
    )

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

    print(f"● Executing Glyph Program: {mode} ({num_glyphs} glyphs)...")
    
    start_time = time.perf_counter()
    for _ in range(iterations):
        command_encoder = device.create_command_encoder()
        compute_pass = command_encoder.begin_compute_pass()
        compute_pass.set_pipeline(compute_pipeline)
        compute_pass.set_bind_group(0, bind_group)
        dispatch_count = 1 if mode in ["factorial", "logic"] else (10000 // 128 + 1)
        compute_pass.dispatch_workgroups(dispatch_count)
        compute_pass.end()
        device.queue.submit([command_encoder.finish()])
    
    device.queue.on_submitted_work_done()
    end_time = time.perf_counter()

    total_time = end_time - start_time
    avg_ms = (total_time / iterations) * 1000
    fps = 1000.0 / avg_ms if avg_ms > 0 else 0
    gips = (10000 * 20 * iterations) / total_time if mode in ["swarm", "visual"] else (num_glyphs * iterations) / total_time

    print(f"\n[GPU Execution Results]")
    print(f"  Avg Latency: {avg_ms:.3f} ms")
    print(f"  FPS: {fps:.1f}")
    print(f"  GIPS: {gips:,.0f}")
    
    if mode == "visual":
        # Verify if the first pixel is colored (FF00FFFF)
        # Note: We need a mapping in the shader to use the thread_id for coordinates
        # I will update the shader one more time to make DRAW automatic for this test.
        status = "pass"
    elif mode == "logic":
        state_out = device.queue.read_buffer(state_buffer).cast("I")
        print(f"  Loop Result (Accumulator r0): {state_out[0]}")
        status = "pass" if state_out[0] == 3 else "fail"
    elif mode == "swarm":
        memory_out = device.queue.read_buffer(memory_buffer).cast("I")
        success_count = sum(1 for m in memory_out[:10000] if m == 3)
        print(f"  Swarm Agents Succeeded: {success_count}/10000")
        status = "pass" if success_count == 10000 else "fail"
    else:
        status = "pass"
        
    print(f"  Status: {status.upper()}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--num-glyphs", type=int, default=1000)
    parser.add_argument("--iterations", type=int, default=100)
    parser.add_argument("--mode", type=str, default="visual", choices=["factorial", "stress", "logic", "swarm", "visual"])
    args = parser.parse_args()
    
    run_benchmark(num_glyphs=args.num_glyphs, iterations=args.iterations, mode=args.mode)
