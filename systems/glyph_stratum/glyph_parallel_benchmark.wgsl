// ============================================================================
// GLYPH PARALLEL BENCHMARK SHADER
// ============================================================================
// Runs multiple independent VMs in parallel, each executing a factorial program
// Each VM loops until halt, maximizing GPU throughput

struct VMState {
    regs: array<u32, 8>,  // r0-r7
    pc: u32,
    halted: u32,
    cycles: u32,
    _pad: u32,
}

@group(0) @binding(0) var<storage, read> program: array<u32>;
@group(0) @binding(1) var<storage, read_write> states: array<VMState>;
@group(0) @binding(2) var<storage, read_write> results: array<u32>;

// Opcodes
const OP_DATA: u32 = 14u;
const OP_MUL: u32 = 7u;
const OP_SUB: u32 = 6u;
const OP_BNZ: u32 = 209u;
const OP_HALT: u32 = 255u;

@compute @workgroup_size(256)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let vm_id = global_id.x;
    let state_offset = vm_id;

    // Load state
    var r0 = states[state_offset].regs[0];
    var r1 = states[state_offset].regs[1];
    var r2 = states[state_offset].regs[2];
    var r3 = states[state_offset].regs[3];
    var pc = states[state_offset].pc;
    var halted = states[state_offset].halted;
    var cycles = states[state_offset].cycles;

    // Execute up to 1000 instructions per dispatch
    let max_cycles = 1000u;

    while (halted == 0u && cycles < max_cycles) {
        // Fetch instruction (4 u32s per instruction)
        let inst_offset = pc * 4u;

        if (inst_offset + 3u >= 1024u) {
            halted = 1u;
            break;
        }

        let opcode = program[inst_offset];
        let p1 = program[inst_offset + 1u];
        let p2 = program[inst_offset + 2u];
        let p3 = program[inst_offset + 3u];

        // Execute
        switch (opcode) {
            case 14u: { // OP_DATA: r[p1] = p2
                if (p1 == 0u) { r0 = p2; }
                else if (p1 == 1u) { r1 = p2; }
                else if (p1 == 2u) { r2 = p2; }
                else if (p1 == 3u) { r3 = p2; }
                pc += 1u;
            }
            case 7u: { // OP_MUL: r[p3] = r[p1] * r[p2]
                var result = 0u;
                if (p1 == 0u) { result = r0; }
                else if (p1 == 1u) { result = r1; }
                else if (p1 == 2u) { result = r2; }
                else if (p1 == 3u) { result = r3; }

                var operand = 0u;
                if (p2 == 0u) { operand = r0; }
                else if (p2 == 1u) { operand = r1; }
                else if (p2 == 2u) { operand = r2; }
                else if (p2 == 3u) { operand = r3; }

                result = result * operand;

                if (p3 == 0u) { r0 = result; }
                else if (p3 == 1u) { r1 = result; }
                else if (p3 == 2u) { r2 = result; }
                else if (p3 == 3u) { r3 = result; }
                pc += 1u;
            }
            case 6u: { // OP_SUB: r[p3] = r[p1] - r[p2]
                var result = 0u;
                if (p1 == 0u) { result = r0; }
                else if (p1 == 1u) { result = r1; }
                else if (p1 == 2u) { result = r2; }
                else if (p1 == 3u) { result = r3; }

                var operand = 0u;
                if (p2 == 0u) { operand = r0; }
                else if (p2 == 1u) { operand = r1; }
                else if (p2 == 2u) { operand = r2; }
                else if (p2 == 3u) { operand = r3; }

                result = result - operand;

                if (p3 == 0u) { r0 = result; }
                else if (p3 == 1u) { r1 = result; }
                else if (p3 == 2u) { r2 = result; }
                else if (p3 == 3u) { r3 = result; }
                pc += 1u;
            }
            case 209u: { // OP_BNZ: if r[p1] != 0, pc = p2
                var test_val = 0u;
                if (p1 == 0u) { test_val = r0; }
                else if (p1 == 1u) { test_val = r1; }
                else if (p1 == 2u) { test_val = r2; }
                else if (p1 == 3u) { test_val = r3; }

                if (test_val != 0u) {
                    pc = p2;
                } else {
                    pc += 1u;
                }
            }
            case 255u: { // OP_HALT
                halted = 1u;
            }
            default: {
                pc += 1u;
            }
        }

        cycles += 1u;
    }

    // Store state back
    states[state_offset].regs[0] = r0;
    states[state_offset].regs[1] = r1;
    states[state_offset].regs[2] = r2;
    states[state_offset].regs[3] = r3;
    states[state_offset].pc = pc;
    states[state_offset].halted = halted;
    states[state_offset].cycles = cycles;

    // Store result
    results[vm_id] = r2;  // r2 = factorial result
}
