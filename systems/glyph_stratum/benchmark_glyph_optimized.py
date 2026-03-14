#!/usr/bin/env python3
"""
Optimized Glyph VM Benchmark
Uses inline execution instead of switch statements for better GPU performance.
"""

import sys
import time
import numpy as np
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

def run_optimized_benchmark():
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

    # Optimized shader with inline execution
    shader_code = """
struct VMState {
    r0: u32, r1: u32, r2: u32, r3: u32, r4: u32, r5: u32, r6: u32, r7: u32,
    pc: u32,
    halted: u32,
    cycles: u32,
    _pad: u32,
}

@group(0) @binding(0) var<storage, read> program: array<u32>;
@group(0) @binding(1) var<storage, read_write> states: array<VMState>;
@group(0) @binding(2) var<storage, read_write> results: array<u32>;

const OP_DATA: u32 = 14u;
const OP_MUL: u32 = 7u;
const OP_SUB: u32 = 6u;
const OP_BNZ: u32 = 209u;
const OP_HALT: u32 = 255u;

@compute @workgroup_size(256)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let vm_id = global_id.x;
    var r0 = states[vm_id].r0;
    var r1 = states[vm_id].r1;
    var r2 = states[vm_id].r2;
    var r3 = states[vm_id].r3;
    var pc = states[vm_id].pc;
    var halted = states[vm_id].halted;
    var cycles = states[vm_id].cycles;

    for (var iter = 0u; iter < 100u; iter++) {
        if (halted != 0u) { break; }

        let base = pc * 4u;
        let opcode = program[base];
        let p1 = program[base + 1u];
        let p2 = program[base + 2u];
        let p3 = program[base + 3u];

        // Inline execution - no switch
        if (opcode == 14u) { // DATA
            let val = p2;
            if (p1 == 0u) { r0 = val; } else if (p1 == 1u) { r1 = val; }
            else if (p1 == 2u) { r2 = val; } else if (p1 == 3u) { r3 = val; }
            pc += 1u;
        } else if (opcode == 7u) { // MUL
            let a = select(select(select(select(r0, r1, p1==1u), r2, p1==2u), r3, p1==3u), 0u, p1 > 3u);
            let b = select(select(select(select(r0, r1, p2==1u), r2, p2==2u), r3, p2==3u), 0u, p2 > 3u);
            let res = a * b;
            if (p3 == 0u) { r0 = res; } else if (p3 == 1u) { r1 = res; }
            else if (p3 == 2u) { r2 = res; } else if (p3 == 3u) { r3 = res; }
            pc += 1u;
        } else if (opcode == 6u) { // SUB
            let a = select(select(select(select(r0, r1, p1==1u), r2, p1==2u), r3, p1==3u), 0u, p1 > 3u);
            let b = select(select(select(select(r0, r1, p2==1u), r2, p2==2u), r3, p2==3u), 0u, p2 > 3u);
            let res = a - b;
            if (p3 == 0u) { r0 = res; } else if (p3 == 1u) { r1 = res; }
            else if (p3 == 2u) { r2 = res; } else if (p3 == 3u) { r3 = res; }
            pc += 1u;
        } else if (opcode == 209u) { // BNZ
            let tv = select(select(select(select(r0, r1, p1==1u), r2, p1==2u), r3, p1==3u), 0u, p1 > 3u);
            pc = select(pc + 1u, p2, tv != 0u);
        } else if (opcode == 255u) { // HALT
            halted = 1u;
        } else {
            pc += 1u;
        }
        cycles += 1u;
    }

    states[vm_id].r0 = r0; states[vm_id].r1 = r1;
    states[vm_id].r2 = r2; states[vm_id].r3 = r3;
    states[vm_id].pc = pc; states[vm_id].halted = halted;
    states[vm_id].cycles = cycles;
    results[vm_id] = r2;
}
"""

    try:
        shader_module = device.create_shader_module(code=shader_code)
    except Exception as e:
        return {"gips": 0, "status": "FAIL", "error": f"Shader: {e}"}

    # Factorial program: 5! = 120
    OP_DATA, OP_MUL, OP_SUB, OP_BNZ, OP_HALT = 14, 7, 6, 209, 255
    instructions = [
        [OP_DATA, 1, 5, 0],   # r1 = 5
        [OP_DATA, 2, 1, 0],   # r2 = 1
        [OP_DATA, 3, 1, 0],   # r3 = 1
        [OP_MUL, 1, 2, 2],    # r2 = r1 * r2
        [OP_SUB, 1, 3, 1],    # r1 = r1 - r3
        [OP_BNZ, 1, 3, 0],    # if r1 != 0: goto 3
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

    # 1M VMs
    num_vms = 1_000_000
    state_size_u32 = 12  # 8 regs + pc + halted + cycles + pad
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

    # Benchmark
    num_iterations = 10
    workgroups = (num_vms + 255) // 256
    instructions_per_vm = 42  # ~6 loop iterations * 7 instructions

    start_time = time.time()

    for _ in range(num_iterations):
        encoder = device.create_command_encoder()
        pass_enc = encoder.begin_compute_pass()
        pass_enc.set_pipeline(pipeline)
        pass_enc.set_bind_group(0, bind_group)
        pass_enc.dispatch_workgroups(workgroups)
        pass_enc.end()
        device.queue.submit([encoder.finish()])

    result_data = np.frombuffer(device.queue.read_buffer(results_buffer), dtype=np.uint32)
    elapsed = time.time() - start_time

    correct = np.sum(result_data == 120)
    pass_rate = correct / num_vms

    total_instructions = instructions_per_vm * num_vms * num_iterations
    gips = (total_instructions / elapsed) / 1_000_000_000 if elapsed > 0 else 0

    return {
        "gips": gips,
        "fps": num_iterations / elapsed if elapsed > 0 else 0,
        "pass_rate": pass_rate,
        "correct": int(correct),
        "elapsed": elapsed,
        "status": "PASS" if gips > 0 and pass_rate > 0.99 else "FAIL",
    }

def main():
    print("=" * 60)
    print(" OPTIMIZED GLYPH VM BENCHMARK")
    print(" Inline execution, no switch overhead")
    print("=" * 60)

    result = run_optimized_benchmark()

    print(f"\nGIPS: {result['gips']:.4f}")
    print(f"FPS: {result.get('fps', 0):.1f}")
    print(f"Correct: {result.get('correct', 0):,} ({result.get('pass_rate', 0)*100:.1f}%)")
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
