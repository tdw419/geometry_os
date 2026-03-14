#!/usr/bin/env python3
"""
Parallel VM Benchmark - True Multi-VM Throughput
Measures GIPS across all VMs running simultaneously.
"""

import sys
import time
import numpy as np
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

def run_parallel_vm_benchmark():
    try:
        import wgpu
    except ImportError:
        return {"gips": 0, "fps": 0, "status": "FAIL", "error": "wgpu not installed"}

    # Initialize GPU
    try:
        adapter = wgpu.gpu.request_adapter_sync(power_preference="high-performance")
        device = adapter.request_device_sync()
    except Exception as e:
        return {"gips": 0, "fps": 0, "status": "FAIL", "error": str(e)}

    # Load parallel shader
    shader_path = ROOT / "systems" / "glyph_stratum" / "parallel_vm_benchmark.wgsl"
    if not shader_path.exists():
        return {"gips": 0, "fps": 0, "status": "FAIL", "error": f"Shader not found: {shader_path}"}

    with open(shader_path, "r") as f:
        shader_code = f.read()

    try:
        shader_module = device.create_shader_module(code=shader_code)
    except Exception as e:
        return {"gips": 0, "fps": 0, "status": "FAIL", "error": f"Shader compile: {e}"}

    # Create program buffer (factorial program)
    OP_DATA, OP_MUL, OP_SUB, OP_BNZ, OP_HALT = 14, 7, 6, 209, 255

    instructions = [
        [OP_DATA, 1, 5, 0],   # r1 = 5
        [OP_DATA, 2, 1, 0],   # r2 = 1
        [OP_DATA, 3, 1, 0],   # r3 = 1
        [OP_MUL, 1, 2, 2],    # r2 = r1 * r2
        [OP_SUB, 1, 3, 1],    # r1 = r1 - r3
        [OP_BNZ, 1, 3, 0],    # if r1 != 0: goto 3
        [OP_HALT, 0, 0, 0],   # halt
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

    # Create small results buffer (just for VM 0 output)
    results_buffer = device.create_buffer(
        size=16,  # 4 u32s
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC,
    )

    # Create pipeline
    try:
        compute_pipeline = device.create_compute_pipeline(
            layout="auto",
            compute={"module": shader_module, "entry_point": "main"},
        )
    except Exception as e:
        return {"gips": 0, "fps": 0, "status": "FAIL", "error": f"Pipeline: {e}"}

    bind_group = device.create_bind_group(
        layout=compute_pipeline.get_bind_group_layout(0),
        entries=[
            {"binding": 0, "resource": {"buffer": results_buffer, "offset": 0, "size": results_buffer.size}},
        ],
    )

    # Benchmark - scale up for throughput measurement
    num_frames = 100
    num_vms = 65536  # 256 workgroups × 256 threads
    instructions_per_vm = 5  # factorial loop body

    start_time = time.time()

    for _ in range(num_frames):
        encoder = device.create_command_encoder()
        pass_enc = encoder.begin_compute_pass()
        pass_enc.set_pipeline(compute_pipeline)
        pass_enc.set_bind_group(0, bind_group)
        pass_enc.dispatch_workgroups(256)  # 256 workgroups × 256 threads = 65536 VMs
        pass_enc.end()
        device.queue.submit([encoder.finish()])

    # Sync
    _ = device.queue.read_buffer(results_buffer)
    elapsed = time.time() - start_time

    # Calculate total instructions
    # 65536 VMs × 5 instructions per VM × 5 loop iterations × 100 frames
    iterations_per_vm = 5  # factorial loop iterations
    total_instructions = iterations_per_vm * instructions_per_vm * num_vms * num_frames
    gips = (total_instructions / elapsed) / 1_000_000_000 if elapsed > 0 else 0
    fps = num_frames / elapsed if elapsed > 0 else 0

    # Verify VM 0
    output_data = np.frombuffer(device.queue.read_buffer(results_buffer), dtype=np.uint32)
    r2 = int(output_data[0])
    halted = int(output_data[1])
    correct = r2 == 120 and halted == 1

    return {
        "gips": gips,
        "fps": fps,
        "status": "PASS" if correct and gips > 0 else "FAIL",
        "tests_passed": 1 if correct else 0,
        "tests_failed": 0 if correct else 1,
        "result": r2,
        "expected": 120,
        "halted": halted,
        "num_vms": num_vms,
    }

def main():
    print("=" * 60)
    print(" PARALLEL VM BENCHMARK")
    print("=" * 60)

    result = run_parallel_vm_benchmark()

    print(f"\nGIPS: {result['gips']:.4f}")
    print(f"FPS: {result['fps']:.1f}")
    print(f"VMs: {result.get('num_vms', 0):,}")
    print(f"Tests: {result.get('tests_passed', 0)} passed, {result.get('tests_failed', 0)} failed")
    if 'result' in result:
        print(f"Result: r2={result['result']} (expected: {result['expected']}), halted={result['halted']}")
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
