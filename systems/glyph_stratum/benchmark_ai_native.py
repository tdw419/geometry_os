import os
import sys
import time
import argparse
import numpy as np
import wgpu
from pathlib import Path

# Paths
ROOT = Path(__file__).parent.parent.parent.absolute()
SHADER_PATH = ROOT / "systems/infinite_map_rs/shaders/glyph_microcode.wgsl"

def run_benchmark(num_glyphs=1000, iterations=100, mode="stress"):
    # Initialize WGPU
    adapter = wgpu.gpu.request_adapter_sync(power_preference="high-performance")
    device = adapter.request_device_sync()

    # Load Shader
    with open(SHADER_PATH, "r") as f:
        shader_code = f.read()
    
    shader_module = device.create_shader_module(code=shader_code)

    # Setup Buffers
    # 0: Program (array of Glyph: opcode: u32, stratum: u32, p1: f32, p2: f32, target: u32)
    # Glyph is 5 * 4 = 20 bytes. Let's use 32-byte alignment if needed, but array<Glyph> is packed.
    # Actually WGSL struct alignment for Glyph {u32, u32, f32, f32, u32} is 20 bytes, but array padding might apply.
    # In the shader: struct Glyph { opcode: u32, stratum: u32, p1: f32, p2: f32, target: u32 };
    # Total size per glyph = 20 bytes.
    program_size = max(num_glyphs, 10) * 20
    program_buffer = device.create_buffer(size=program_size, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST)
    
    # 1: State { pc: u32, sp: u32, flags: u32, halted: u32, cycles: u32 } = 5 * 4 = 20 bytes
    state_buffer = device.create_buffer(size=20, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST)
    
    # 2: Memory (array<f32>)
    memory_buffer = device.create_buffer(size=65536 * 4, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST)
    
    # 3: Stack (array<u32>)
    stack_buffer = device.create_buffer(size=1024 * 4, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST)

    # 4: Atlas (texture_2d<f32>)
    atlas_texture = device.create_texture(
        size=(1024, 1024, 1),
        usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
        format=wgpu.TextureFormat.rgba8unorm, # Using rgba8unorm as atlas usually is
    )

    # 5: Screen (texture_storage_2d<rgba8unorm, write>)
    screen_texture = device.create_texture(
        size=(1024, 1024, 1),
        usage=wgpu.TextureUsage.STORAGE_BINDING | wgpu.TextureUsage.COPY_SRC,
        format=wgpu.TextureFormat.rgba8unorm,
    )

    # Initialize Program Data (Coin Flip Simulation if mode is stress)
    # 0: BRANCH_PROB p1=0.5, p2=2.0
    # 1: MOV mem[10]=2.0; JMP 4
    # 2: MOV mem[10]=1.0; JMP 4
    # 3: JMP 4
    # 4: HALT
    if mode == "stress":
        # We'll just fill the program with random arithmetic to stress the GPU
        data = np.zeros(num_glyphs * 5, dtype=np.uint32)
        for i in range(num_glyphs - 1):
            data[i*5] = 200 # ADD
            data[i*5 + 1] = 1 # stratum
            data[i*5 + 2] = np.float32(1.0).view(np.uint32) # p1
            data[i*5 + 3] = np.float32(2.0).view(np.uint32) # p2
            data[i*5 + 4] = i % 100 # target reg
        data[(num_glyphs-1)*5] = 212 # HALT
        device.queue.write_buffer(program_buffer, 0, data.tobytes())

    # Create Pipeline
    compute_pipeline = device.create_compute_pipeline(
        layout="auto",
        compute={"module": shader_module, "entry_point": "main"},
    )

    # Create Bind Group
    bind_group = device.create_bind_group(
        layout=compute_pipeline.get_bind_group_layout(0),
        entries=[
            {"binding": 0, "resource": {"buffer": program_buffer, "offset": 0, "size": program_buffer.size}},
            {"binding": 1, "resource": {"buffer": state_buffer, "offset": 0, "size": state_buffer.size}},
            {"binding": 2, "resource": {"buffer": memory_buffer, "offset": 0, "size": memory_buffer.size}},
            {"binding": 3, "resource": {"buffer": stack_buffer, "offset": 0, "size": stack_buffer.size}},
            {"binding": 4, "resource": atlas_texture.create_view()},
            {"binding": 5, "resource": screen_texture.create_view()},
        ],
    )

    # Execution
    print(f"● Executing AI-Native Glyph Benchmark: {mode} ({num_glyphs} glyphs, {iterations} iterations)...")
    
    start_time = time.perf_counter()
    for _ in range(iterations):
        # Reset state for each iteration to avoid immediate halt
        device.queue.write_buffer(state_buffer, 0, np.zeros(5, dtype=np.uint32).tobytes())
        
        command_encoder = device.create_command_encoder()
        compute_pass = command_encoder.begin_compute_pass()
        compute_pass.set_pipeline(compute_pipeline)
        compute_pass.set_bind_group(0, bind_group)
        compute_pass.dispatch_workgroups(1) # We only run 1 instance for the serial PC execution in microcode.wgsl
        compute_pass.end()
        device.queue.submit([command_encoder.finish()])
    
    device.queue.on_submitted_work_done()
    end_time = time.perf_counter()

    total_time = end_time - start_time
    avg_ms = (total_time / iterations) * 1000
    fps = 1.0 / (total_time / iterations)
    gips = (num_glyphs * iterations) / total_time

    print(f"\n[GPU Execution Results]")
    print(f"  Avg Latency: {avg_ms:.3f} ms")
    print(f"  FPS: {fps:.1f}")
    print(f"  GIPS: {gips:,.0f}")
    
    # Read back result for entropy check if mode is coin_flip
    # (Simplified for now)
    
    return {"gips": gips, "fps": fps}

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--num-glyphs", type=int, default=100)
    parser.add_argument("--iterations", type=int, default=100)
    parser.add_argument("--mode", type=str, default="stress")
    args = parser.parse_args()
    
    run_benchmark(num_glyphs=args.num_glyphs, iterations=args.iterations, mode=args.mode)
