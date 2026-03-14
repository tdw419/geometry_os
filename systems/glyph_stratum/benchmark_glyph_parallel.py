#!/usr/bin/env python3
"""
Glyph Parallel VM Benchmark
Runs 1M VMs in parallel, each executing factorial program with looping.
"""

import sys
import time
import numpy as np
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

def run_parallel_benchmark():
    try:
        import wgpu
    except ImportError:
        return {"gips": 0, "status": "FAIL", "error": "wgpu not installed"}

    # Initialize GPU
    try:
        adapter = wgpu.gpu.request_adapter_sync(power_preference="high-performance")
        device = adapter.request_device_sync()
    except Exception as e:
        return {"gips": 0, "status": "FAIL", "error": str(e)}

    # Load parallel shader
    shader_path = ROOT / "systems" / "glyph_stratum" / "glyph_parallel_benchmark.wgsl"
    if not shader_path.exists():
        return {"gips": 0, "status": "FAIL", "error": f"Shader not found: {shader_path}"}

    with open(shader_path, "r") as f:
        shader_code = f.read()

    try:
        shader_module = device.create_shader_module(code=shader_code)
    except Exception as e:
        return {"gips": 0, "status": "FAIL", "error": f"Shader compile: {e}"}

    # Create program buffer (factorial program)
    # Each instruction is 4 u32s: [opcode, p1, p2, p3]
    OP_DATA, OP_MUL, OP_SUB, OP_BNZ, OP_HALT = 14, 7, 6, 209, 255

    instructions = [
        [OP_DATA, 1, 5, 0],   # r1 = 5
        [OP_DATA, 2, 1, 0],   # r2 = 1
        [OP_DATA, 3, 1, 0],   # r3 = 1
        [OP_MUL, 1, 2, 2],    # r2 = r1 * r2 (r2=5*1=5)
        [OP_SUB, 1, 3, 1],    # r1 = r1 - r3 (r1=5-1=4)
        [OP_BNZ, 1, 3, 0],    # if r1 != 0: goto 3
        [OP_HALT, 0, 0, 0],   # halt
    ]

    # Flatten to u32 array
    program_data = []
    for inst in instructions:
        program_data.extend(inst)

    # Pad to 1024 u32s
    while len(program_data) < 1024:
        program_data.append(0)

    program_buffer = device.create_buffer(
        size=len(program_data) * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST,
    )
    device.queue.write_buffer(program_buffer, 0, np.array(program_data, dtype=np.uint32).tobytes())

    # Create state buffer for 1M VMs
    # Each VMState: regs[8] + pc + halted + cycles + _pad = 12 u32s = 48 bytes
    num_vms = 1_000_000
    state_size_u32 = 12
    state_data = np.zeros(num_vms * state_size_u32, dtype=np.uint32)
    # Initialize: r1=5, r2=1, r3=1 for each VM
    for i in range(num_vms):
        base = i * state_size_u32
        state_data[base + 1] = 5   # r1 = 5
        state_data[base + 2] = 1   # r2 = 1
        state_data[base + 3] = 1   # r3 = 1
        state_data[base + 4] = 0   # pc = 0
        state_data[base + 5] = 0   # halted = 0
        state_data[base + 6] = 0   # cycles = 0

    state_buffer = device.create_buffer(
        size=state_data.nbytes,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC,
    )
    device.queue.write_buffer(state_buffer, 0, state_data.tobytes())

    # Create results buffer (1 u32 per VM)
    results_buffer = device.create_buffer(
        size=num_vms * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC,
    )

    # Create pipeline
    try:
        pipeline = device.create_compute_pipeline(
            layout="auto",
            compute={"module": shader_module, "entry_point": "main"},
        )
    except Exception as e:
        return {"gips": 0, "status": "FAIL", "error": f"Pipeline: {e}"}

    bind_group = device.create_bind_group(
        layout=pipeline.get_bind_group_layout(0),
        entries=[
            {"binding": 0, "resource": {"buffer": program_buffer, "offset": 0, "size": program_buffer.size}},
            {"binding": 1, "resource": {"buffer": state_buffer, "offset": 0, "size": state_buffer.size}},
            {"binding": 2, "resource": {"buffer": results_buffer, "offset": 0, "size": results_buffer.size}},
        ],
    )

    # Benchmark
    num_iterations = 10
    workgroups = (num_vms + 255) // 256  # ceil(1M / 256) = 3907
    instructions_per_vm = 7 * 6  # 7 instructions, ~6 loops = 42 instructions per VM

    start_time = time.time()

    for _ in range(num_iterations):
        encoder = device.create_command_encoder()
        pass_enc = encoder.begin_compute_pass()
        pass_enc.set_pipeline(pipeline)
        pass_enc.set_bind_group(0, bind_group)
        pass_enc.dispatch_workgroups(workgroups)
        pass_enc.end()
        device.queue.submit([encoder.finish()])

    # Read to force sync
    result_data = np.frombuffer(device.queue.read_buffer(results_buffer), dtype=np.uint32)
    elapsed = time.time() - start_time

    # Verify first few results
    correct_count = np.sum(result_data == 120)
    pass_rate = correct_count / num_vms

    # Calculate GIPS
    total_instructions = instructions_per_vm * num_vms * num_iterations
    gips = (total_instructions / elapsed) / 1_000_000_000 if elapsed > 0 else 0

    return {
        "gips": gips,
        "fps": (num_iterations / elapsed) if elapsed > 0 else 0,
        "total_instructions": total_instructions,
        "elapsed": elapsed,
        "vms": num_vms,
        "pass_rate": pass_rate,
        "correct_count": int(correct_count),
        "status": "PASS" if gips > 0 and pass_rate > 0.99 else "FAIL",
    }

def main():
    print("=" * 60)
    print(" GLYPH PARALLEL VM BENCHMARK")
    print(" 1M VMs, factorial program, looping execution")
    print("=" * 60)

    result = run_parallel_benchmark()

    print(f"\nGIPS: {result['gips']:.4f}")
    print(f"FPS: {result.get('fps', 0):.1f}")
    if 'total_instructions' in result:
        print(f"Total instructions: {result['total_instructions']:,}")
        print(f"Elapsed time: {result['elapsed']:.3f}s")
        print(f"VMs: {result['vms']:,}")
        print(f"Correct: {result['correct_count']:,} / {result['vms']:,} ({result['pass_rate']*100:.1f}%)")
    if 'error' in result:
        print(f"Error: {result['error']}")
    print(f"Status: {result['status']}")
    print("=" * 60)

    if result['status'] == "PASS":
        print("✅ PASS")
        sys.exit(0)
    else:
        print("❌ FAIL")
        sys.exit(1)

if __name__ == "__main__":
    main()
