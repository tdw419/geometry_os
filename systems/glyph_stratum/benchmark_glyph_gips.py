#!/usr/bin/env python3
"""
Glyph VM GIPS Stress Benchmark
Measures actual GPU compute capacity for glyph execution.
"""

import sys
import time
import numpy as np
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

def run_stress_benchmark():
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

    # Load shader from evolvable file (allows evolution to optimize it)
    shader_path = ROOT / "systems" / "glyph_stratum" / "benchmark_shader.wgsl"

    try:
        with open(shader_path) as f:
            shader_code = f.read()
    except FileNotFoundError:
        # Fallback to hardcoded if file missing
        shader_code = """
    @group(0) @binding(0) var<storage, read_write> data: array<u32>;

    @compute @workgroup_size(512)
    fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
        let idx = global_id.x;
        if (idx >= 500000u) { return; }
        var acc = data[idx];
        for (var i = 0u; i < 20000u; i++) {
            acc = (acc * 1103515245u + 12345u) % 2147483648u;
            acc = (acc ^ (acc >> 16u)) * 2654435761u;
        }
        data[idx] = acc;
    }
    """

    try:
        shader_module = device.create_shader_module(code=shader_code)
    except Exception as e:
        return {"gips": 0, "status": "FAIL", "error": f"Shader: {e}"}

    # Create buffer with 500K elements (matching shader config)
    num_elements = 500_000
    initial_data = np.arange(num_elements, dtype=np.uint32)
    buffer = device.create_buffer(
        size=num_elements * 4,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC,
    )
    device.queue.write_buffer(buffer, 0, initial_data.tobytes())

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
            {"binding": 0, "resource": {"buffer": buffer, "offset": 0, "size": buffer.size}},
        ],
    )

    # Calculate workgroups based on shader workgroup size
    # Parse workgroup_size from shader or use default 512
    wg_size = 512
    if "@workgroup_size(" in shader_code:
        import re
        match = re.search(r'@workgroup_size\((\d+)', shader_code)
        if match:
            wg_size = int(match.group(1))

    num_workgroups = (num_elements + wg_size - 1) // wg_size

    # Warmup
    encoder = device.create_command_encoder()
    pass_enc = encoder.begin_compute_pass()
    pass_enc.set_pipeline(pipeline)
    pass_enc.set_bind_group(0, bind_group)
    pass_enc.dispatch_workgroups(num_workgroups)
    pass_enc.end()
    device.queue.submit([encoder.finish()])

    # Benchmark - run iterations separately to measure actual GPU work
    num_iterations = 10
    ops_per_thread = 20000  # Match shader config
    total_ops = num_elements * ops_per_thread * num_iterations

    start_time = time.time()

    # Run iterations - separate submissions to ensure all work is done
    for i in range(num_iterations):
        encoder = device.create_command_encoder()
        pass_enc = encoder.begin_compute_pass()
        pass_enc.set_pipeline(pipeline)
        pass_enc.set_bind_group(0, bind_group)
        pass_enc.dispatch_workgroups(num_workgroups)
        pass_enc.end()
        device.queue.submit([encoder.finish()])

    # Read buffer blocks until GPU completes - this is the real sync point
    result_data = np.frombuffer(device.queue.read_buffer(buffer), dtype=np.uint32)
    elapsed = time.time() - start_time
    changed = not np.array_equal(result_data, initial_data)

    # Calculate GIPS
    gips = (total_ops / elapsed) / 1_000_000_000 if elapsed > 0 else 0

    return {
        "gips": gips,
        "ops_per_iteration": total_ops,
        "elapsed": elapsed,
        "threads": num_elements,
        "status": "PASS" if gips > 0 and changed else "FAIL",
    }

def main():
    print("=" * 60)
    print(" GLYPH VM GIPS STRESS BENCHMARK")
    print("=" * 60)

    result = run_stress_benchmark()

    print(f"\nGIPS: {result['gips']:.4f}")
    if 'ops_per_iteration' in result:
        print(f"Total operations: {result['ops_per_iteration']:,}")
        print(f"Elapsed time: {result['elapsed']:.3f}s")
        print(f"Threads: {result['threads']:,}")
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
