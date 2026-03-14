#!/usr/bin/env python3
"""
Glyph VM FPS Benchmark - Intel i915 Compatible
Uses storage buffers instead of read_write textures.
"""

import sys
import time
import numpy as np
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

def run_pure_glyph_benchmark():
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

    # Load shader
    shader_path = ROOT / "systems" / "glyph_stratum" / "glyph_benchmark_shader.wgsl"
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

    # Each instruction is 4 u32s: [opcode, p1, p2, p3]
    instructions = [
        [OP_DATA, 1, 5, 0],   # r1 = 5
        [OP_DATA, 2, 1, 0],   # r2 = 1
        [OP_DATA, 3, 1, 0],   # r3 = 1
        [OP_MUL, 1, 2, 2],    # r2 = r1 * r2 (p3=dest, p1=src1, p2=src2) -> r2=5*1=5
        [OP_SUB, 1, 3, 1],    # r1 = r1 - r3 (p3=dest, p1=src1, p2=src2) -> r1=5-1=4
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

    # Create state buffer (GlyphState: regs[32] + pc + halted + stratum + cycles)
    state_size = (32 + 4) * 4
    state_buffer = device.create_buffer(
        size=state_size,
        usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST,
    )

    # Create output buffer
    output_buffer = device.create_buffer(
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

    # Create bind group
    bind_group = device.create_bind_group(
        layout=compute_pipeline.get_bind_group_layout(0),
        entries=[
            {"binding": 0, "resource": {"buffer": program_buffer, "offset": 0, "size": program_buffer.size}},
            {"binding": 1, "resource": {"buffer": state_buffer, "offset": 0, "size": state_buffer.size}},
            {"binding": 2, "resource": {"buffer": output_buffer, "offset": 0, "size": output_buffer.size}},
        ],
    )

    # Benchmark - scaled up for higher throughput
    num_frames = 1000
    num_vms = 65535  # Max workgroups
    instructions_per_vm = len(instructions)

    start_time = time.time()

    for _ in range(num_frames):
        encoder = device.create_command_encoder()
        pass_enc = encoder.begin_compute_pass()
        pass_enc.set_pipeline(compute_pipeline)
        pass_enc.set_bind_group(0, bind_group)
        pass_enc.dispatch_workgroups(num_vms)
        pass_enc.end()
        device.queue.submit([encoder.finish()])

    # Read to force sync
    _ = device.queue.read_buffer(output_buffer)
    elapsed = time.time() - start_time

    total_instructions = instructions_per_vm * num_vms * num_frames
    gips = (total_instructions / elapsed) / 1_000_000_000 if elapsed > 0 else 0
    fps = num_frames / elapsed if elapsed > 0 else 0

    # Verify
    output_data = np.frombuffer(device.queue.read_buffer(output_buffer), dtype=np.uint32)
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
    }

def main():
    print("=" * 60)
    print(" GLYPH VM BENCHMARK (Intel i915 Compatible)")
    print("=" * 60)

    result = run_pure_glyph_benchmark()

    print(f"\nGIPS: {result['gips']:.4f}")
    print(f"FPS: {result['fps']:.1f}")
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
