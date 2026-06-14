// ============================================================================
// GLYPH BENCHMARK SHADER - Intel i915 Compatible
// ============================================================================
// Uses storage buffers instead of read_write textures for maximum compatibility

@group(0) @binding(0) var<storage, read> program: array<u32>;
@group(0) @binding(1) var<storage, read_write> state: array<u32>;
@group(0) @binding(2) var<storage, read_write> output: array<u32>;

// State layout: regs[0-31], pc[32], halted[33], stratum[34], cycles[35]

fn get_reg(idx: u32) -> u32 {
    if (idx < 32u) { return state[idx]; }
    return 0u;
}

fn set_reg(idx: u32, val: u32) {
    if (idx < 32u) { state[idx] = val; }
}

fn get_pc() -> u32 { return state[32]; }
fn set_pc(val: u32) { state[32] = val; }
fn get_halted() -> u32 { return state[33]; }
fn set_halted(val: u32) { state[33] = val; }
fn get_cycles() -> u32 { return state[35]; }
fn add_cycles() { state[35] = state[35] + 1u; }

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    if (global_id.x != 0u) { return; }

    let max_cycles = 1000u;

    for (var cycle = 0u; cycle < max_cycles; cycle = cycle + 1u) {
        if (get_halted() != 0u) { break; }

        let pc = get_pc();
        let offset = pc * 4u;

        if (offset + 3u >= 1024u) {
            set_halted(1u);
            break;
        }

        let op = program[offset];
        let p1 = program[offset + 1u];
        let p2 = program[offset + 2u];
        let p3 = program[offset + 3u];

        if (op == 14u) {  // DATA: r[p1] = p2
            set_reg(p1, p2);
            set_pc(pc + 1u);
        } else if (op == 7u) {  // MUL: r[p3] = r[p1] * r[p2]
            set_reg(p3, get_reg(p1) * get_reg(p2));
            set_pc(pc + 1u);
        } else if (op == 6u) {  // SUB: r[p3] = r[p1] - r[p2]
            set_reg(p3, get_reg(p1) - get_reg(p2));
            set_pc(pc + 1u);
        } else if (op == 209u) {  // BNZ: if r[p1] != 0, pc = p2
            if (get_reg(p1) != 0u) {
                set_pc(p2);
            } else {
                set_pc(pc + 1u);
            }
        } else if (op == 255u) {  // HALT
            set_halted(1u);
        } else {
            set_pc(pc + 1u);  // Unknown opcode, skip
        }

        add_cycles();
    }

    output[0] = get_reg(2);
    output[1] = get_halted();
    output[2] = get_cycles();
}
