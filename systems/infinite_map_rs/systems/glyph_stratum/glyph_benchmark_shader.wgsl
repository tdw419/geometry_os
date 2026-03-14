// ============================================================================
// GLYPH BENCHMARK SHADER - Intel i915 Compatible
// ============================================================================
// Uses storage buffers instead of read_write textures for maximum compatibility

struct GlyphInstruction {
    opcode: u32,
    p1: u32,
    p2: u32,
    p3: u32,
}

struct GlyphState {
    regs: array<u32, 32>,
    pc: u32,
    halted: u32,
    stratum: u32,
    cycles: u32,
}

struct Output {
    result: u32,
    halted: u32,
    cycles: u32,
    _pad: u32,
}

@group(0) @binding(0) var<storage, read> program: array<u32>;
@group(0) @binding(1) var<storage, read_write> state: array<u32>;
@group(0) @binding(2) var<storage, read_write> output: array<u32>;

// Opcodes
const OP_NOP: u32 = 0u;
const OP_DATA: u32 = 14u;
const OP_ADD: u32 = 4u;
const OP_SUB: u32 = 6u;
const OP_MUL: u32 = 7u;
const OP_DIV: u32 = 8u;
const OP_MOD: u32 = 9u;
const OP_AND: u32 = 10u;
const OP_OR: u32 = 11u;
const OP_XOR: u32 = 12u;
const OP_NOT: u32 = 13u;
const OP_JMP: u32 = 208u;
const OP_JZ: u32 = 209u;
const OP_BNZ: u32 = 209u;  // Alias
const OP_HALT: u32 = 255u;

fn get_reg(idx: u32) -> u32 {
    if (idx < 32u) {
        return state[idx];
    }
    return 0u;
}

fn set_reg(idx: u32, val: u32) {
    if (idx < 32u) {
        state[idx] = val;
    }
}

fn get_pc() -> u32 { return state[32]; }
fn set_pc(val: u32) { state[32] = val; }
fn get_halted() -> u32 { return state[33]; }
fn set_halted(val: u32) { state[33] = val; }
fn get_cycles() -> u32 { return state[35]; }
fn add_cycles(val: u32) { state[35] = state[35] + val; }

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    if (get_halted() != 0u) {
        output[0] = get_reg(2);  // r2 = result
        output[1] = 1u;           // halted
        output[2] = get_cycles();
        return;
    }

    // Fetch instruction (4 u32s per instruction)
    let pc = get_pc();
    let inst_offset = pc * 4u;

    if (inst_offset + 3u >= 1024u) {
        set_halted(1u);
        return;
    }

    let opcode = program[inst_offset];
    let p1 = program[inst_offset + 1u];
    let p2 = program[inst_offset + 2u];
    let p3 = program[inst_offset + 3u];

    // Decode and execute
    switch (opcode) {
        case 14u: { // OP_DATA: r[p1] = p2
            set_reg(p1, p2);
            set_pc(pc + 1u);
        }
        case 7u: { // OP_MUL: r[p3] = r[p1] * r[p2]
            set_reg(p3, get_reg(p1) * get_reg(p2));
            set_pc(pc + 1u);
        }
        case 6u: { // OP_SUB: r[p3] = r[p1] - r[p2]
            set_reg(p3, get_reg(p1) - get_reg(p2));
            set_pc(pc + 1u);
        }
        case 209u: { // OP_BNZ: if r[p1] != 0, pc = p2
            if (get_reg(p1) != 0u) {
                set_pc(p2);
            } else {
                set_pc(pc + 1u);
            }
        }
        case 255u: { // OP_HALT
            set_halted(1u);
        }
        default: {
            set_pc(pc + 1u);
        }
    }

    add_cycles(1u);

    // Write output
    output[0] = get_reg(2);
    output[1] = get_halted();
    output[2] = get_cycles();
}
