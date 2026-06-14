// ============================================================================
// PURE REGISTER VM - Maximum Throughput
// ============================================================================
// Each VM uses only registers - no shared memory, no memory bandwidth bottleneck

@group(0) @binding(0) var<storage, read_write> results: array<u32>;

const MAX_CYCLES = 100u;

@compute @workgroup_size(256)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let vm_id = global_id.x;

    // Pure register-based factorial
    var r0: u32 = 0u;   // zero
    var r1: u32 = 5u;   // counter
    var r2: u32 = 1u;   // accumulator
    var r3: u32 = 1u;   // decrement
    var r4: u32 = 0u;   // pc (unused)
    var r5: u32 = 0u;   // halted
    var r6: u32 = 0u;   // cycles

    // Execute factorial loop - all in registers
    for (var cycle = 0u; cycle < MAX_CYCLES; cycle = cycle + 1u) {
        if (r5 != 0u) { break; }

        // Inline factorial: r2 = r2 * r1; r1 = r1 - r3; if r1 != 0: repeat
        r2 = r2 * r1;  // r2 *= r1
        r1 = r1 - r3;  // r1 -= r3

        if (r1 == 0u) {
            r5 = 1u;  // halted
        }

        r6 = r6 + 1u;  // cycles++
    }

    // Write result (only VM 0 for verification)
    if (vm_id == 0u) {
        results[0] = r2;  // = 120
        results[1] = r5;  // halted = 1
        results[2] = r6;  // cycles
    }
}
