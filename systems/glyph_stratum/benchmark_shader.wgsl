// Evolvable GIPS Benchmark Shader
// This file is modified by the evolution cycle to optimize throughput
// Target: 10,000 GIPS

@group(0) @binding(0) var<storage, read_write> data: array<u32>;

                                                                                                        @compute @workgroup_size(256)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    if (idx >= 1000000u) { return; }

    // Each thread does 20000 arithmetic operations for optimal GPU utilization
    // Vectorized: process 4 elements at once
        let base_idx = idx * 4u;
        if (base_idx + 3u >= 1000000u) { return; }
        var acc0 = data[base_idx];
        var acc1 = data[base_idx + 1u];
        var acc2 = data[base_idx + 2u];
        var acc3 = data[base_idx + 3u];

    // Core computation loop - evolution can modify constants and structure
    for (var i = 0u; i < 15000u; i++) {
        // LCG step with XOR mixing
        acc0 = (acc0 * 214013u + 2531011u) & 0x7FFFFFFFu;
            acc0 = (acc0 ^ (acc0 >> 16u)) * 2654435761u;
            acc1 = (acc1 * 214013u + 2531011u) & 0x7FFFFFFFu;
            acc1 = (acc1 ^ (acc1 >> 16u)) * 2654435761u;
            acc2 = (acc2 * 214013u + 2531011u) & 0x7FFFFFFFu;
            acc2 = (acc2 ^ (acc2 >> 16u)) * 2654435761u;
            acc3 = (acc3 * 214013u + 2531011u) & 0x7FFFFFFFu;
            acc3 = (acc3 ^ (acc3 >> 16u)) * 2654435761u;
    }

    data[base_idx] = acc0;
        data[base_idx + 1u] = acc1;
        data[base_idx + 2u] = acc2;
        data[base_idx + 3u] = acc3;
}
