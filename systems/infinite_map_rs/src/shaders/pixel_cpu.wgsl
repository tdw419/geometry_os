// PixelCPU Compute Shader
// Executes 32-bit pixel instructions on GPU
//
// Instruction format (RGBA pixel):
// R = opcode (8 bits)
// G = rd (8 bits) - destination register
// B = rs1 (8 bits) - source register 1
// A = rs2 (8 bits) - source register 2 or immediate

struct PixelCPUState {
    // 32 general-purpose registers
    regs: array<u32, 32>,
    // Program counter
    pc: u32,
    // Flags
    zero_flag: u32,
    halted: u32,
}

// RAM as storage texture (256x256 = 65536 pixels = 262144 bytes)
@group(0) @binding(0) var ram: texture_storage_2d<rgba32uint, read_write>;

// State buffer
@group(0) @binding(1) var<storage, read_write> state: PixelCPUState;

// Opcodes (minimal set + LDI_EXT)
const OP_NOP: u32 = 0;
const OP_MOV: u32 = 1;
const OP_ADD: u32 = 2;
const OP_SUB: u32 = 3;
const OP_MUL: u32 = 4;
const OP_DIV: u32 = 5;
const OP_JMP: u32 = 6;
const OP_HALT: u32 = 7;
const OP_LDI_EXT: u32 = 8;

// Read 32-bit value from RAM at byte address
fn read_u32(addr: u32) -> u32 {
    let pixel_idx = addr / 4u;
    let x = pixel_idx % 256u;
    let y = pixel_idx / 256u;
    let pixel = textureLoad(ram, vec2<i32>(i32(x), i32(y)));
    return pixel.r;
}

// Write 32-bit value to RAM at byte address
fn write_u32(addr: u32, value: u32) {
    let pixel_idx = addr / 4u;
    let x = pixel_idx % 256u;
    let y = pixel_idx / 256u;
    textureStore(ram, vec2<i32>(i32(x), i32(y)), vec4<u32>(value, 0u, 0u, 0u));
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Single-threaded execution for now
    if (global_id.x > 0u || global_id.y > 0u) {
        return;
    }

    // Check if halted
    if (state.halted != 0u) {
        return;
    }

    // Fetch instruction
    let instruction = read_u32(state.pc);
    let opcode = instruction & 0xFFu;
    let rd = (instruction >> 8u) & 0xFFu;
    let rs1 = (instruction >> 16u) & 0xFFu;
    let rs2 = (instruction >> 24u) & 0xFFu;

    // Execute
    if (opcode == OP_NOP) {
        state.pc = state.pc + 4u;
    }
    else if (opcode == OP_MOV) {
        // MOV rd, rs1 - copy register
        if (rd < 32u && rs1 < 32u) {
            state.regs[rd] = state.regs[rs1];
        }
        state.pc = state.pc + 4u;
    }
    else if (opcode == OP_ADD) {
        // ADD rd, rs1, rs2 - add registers
        if (rd < 32u && rs1 < 32u && rs2 < 32u) {
            state.regs[rd] = state.regs[rs1] + state.regs[rs2];
        }
        state.pc = state.pc + 4u;
    }
    else if (opcode == OP_SUB) {
        // SUB rd, rs1, rs2 - subtract registers
        if (rd < 32u && rs1 < 32u && rs2 < 32u) {
            state.regs[rd] = state.regs[rs1] - state.regs[rs2];
        }
        state.pc = state.pc + 4u;
    }
    else if (opcode == OP_MUL) {
        // MUL rd, rs1, rs2 - multiply registers
        if (rd < 32u && rs1 < 32u && rs2 < 32u) {
            state.regs[rd] = state.regs[rs1] * state.regs[rs2];
        }
        state.pc = state.pc + 4u;
    }
    else if (opcode == OP_DIV) {
        // DIV rd, rs1, rs2 - divide registers
        if (rd < 32u && rs1 < 32u && rs2 < 32u) {
            if (state.regs[rs2] != 0u) {
                state.regs[rd] = state.regs[rs1] / state.regs[rs2];
            } else {
                // Division by zero - set result to max u32 value
                state.regs[rd] = 0xFFFFFFFFu;
            }
        }
        state.pc = state.pc + 4u;
    }
    else if (opcode == OP_JMP) {
        // JMP rs1 - jump to address in register
        if (rs1 < 32u) {
            state.pc = state.regs[rs1];
        } else {
            state.pc = state.pc + 4u;
        }
    }
    else if (opcode == OP_LDI_EXT) {
        // LDI_EXT rd - Load immediate from next instruction word
        // Advance PC to next word
        state.pc = state.pc + 4u;

        // Read 32-bit immediate value
        let immediate = read_u32(state.pc);

        // Write to destination register
        if (rd < 32u) {
            state.regs[rd] = immediate;
        }

        // Advance PC past immediate (total +8 from original)
        state.pc = state.pc + 4u;
    }
    else if (opcode == OP_HALT) {
        state.halted = 1u;
    }
    else {
        // Unknown opcode - halt
        state.halted = 1u;
    }
}
