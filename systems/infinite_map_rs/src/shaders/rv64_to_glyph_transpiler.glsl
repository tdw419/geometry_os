#version 450

#extension GL_EXT_shader_explicit_arithmetic_types_int64 : require

#extension GL_EXT_buffer_reference : require

#extension GL_EXT_shader_buffer_reference_uvec2 : require

#extension GL_EXT_nonuniform_qualifier : require

#extension GL_ARB_shader_draw_buffers : require

layout(local_size_x = 1, local_size_y = 1) in;

// ============================================================================
// RV64 to Glyph Transpiler
// ============================================================================
// This shader is a "live transpiler" that converts RV64 instructions to Glyph ISA on-the-fly.
// It can be loaded as a seed_compiler.glyph program to bootstrap glyph-native execution.
// ============================================================================

layout(std430, binding = 0) buffer RV64Kernel {
    uint bytes[];
};

 layout(std430, binding = 1) buffer GlyphOutput {
    uint glyphs[];
};

 layout(std140, binding = 2) uniform Uniforms {
    uint kernel_size;
    uint output_size;
    uint pc;
    uint _pad;
};

// RV64 opcode decode table (matches riscv64_vm.glsl)
const uint RV_OP_LOAD = 0x03u;
const uint RV_OP_IMM = 0x13u;
const uint RV_OP_AUIPC = 0x17u;
const uint RV_OP_STORE = 0x23u;
const uint RV_OP_OP = 0x33u;
const uint RV_OP_BRANCH = 0x63u;
const uint RV_OP_JALR = 0x67u;
const uint RV_OP_JAL = 0x6Fu;
const uint RV_OP_SYSTEM = 0x73u;

// Glyph ISA opcodes (matching glyph_stratum/mod.rs)
const uint GLYPH_NOP = 0u;
const uint GLYPH_ALLOC = 1u;
const uint GLYPH_LOAD = 3u;
const uint GLYPH_STORE = 4u;
const uint GLYPH_ADD = 5u;
const uint GLYPH_SUB = 6u;
const uint GLYPH_LOOP = 15u;
const uint GLYPH_BRANCH = 10u;
const uint GLYPH_HALT = 13u;
const uint GLYPH_ADD_M = 200u;
const uint GLYPH_LD = 204u;
const uint GLYPH_ST = 205u;
const uint GLYPH_JMP = 208u;
const uint GLYPH_SPAWN = 225u;

// Transpilation state
struct TranspileState {
    uint pc;             // Current position in RV64 kernel
    uint output_ptr;     // Current position in glyph output
    uint registers[32];  // Shadow registers
    uint running;
};

layout(std430, binding = 3) buffer StateBuffer {
    TranspileState state;
};

// ============================================================================
// Transpilation Logic
// ============================================================================

// Fetch a 32-bit word from kernel
uint fetch_u32(uint offset) {
    if (offset + 3 >= kernel_size) return 0u;
    return bytes[offset]
         | (bytes[offset + 1] << 8)
         | (bytes[offset + 2] << 16)
         | (bytes[offset + 3] << 24);
}

// Emit a glyph instruction (opcode, stratum, data1, data2)
void emit_glyph(uint opcode, uint stratum, uint data1, uint data2) {
    if (state.output_ptr + 3 < output_size) {
        glyphs[state.output_ptr] = opcode;
        glyphs[state.output_ptr + 1] = stratum;
        glyphs[state.output_ptr + 2] = data1;
        glyphs[state.output_ptr + 3] = data2;
        state.output_ptr += 4;
    }
}

// Transpile a single RV64 instruction
void transpile_instruction(uint inst) {
    uint opcode = inst & 0x7Fu;
    uint rd = (inst >> 7) & 0x1Fu;
    uint funct3 = (inst >> 12) & 0x7u;
    uint rs1 = (inst >> 15) & 0x1Fu;
    uint rs2 = (inst >> 20) & 0x1Fu;

    switch (opcode) {
        case RV_OP_LOAD: {
            // LB/LH/LW/LD -> GLYPH_LOAD
            uint offset = state.registers[rs1] + int(int(inst) >> 20);
            emit_glyph(GLYPH_LOAD, 1u, rd, offset / 4);
            break;
        }
        case RV_OP_STORE: {
            // SB/SH/SW/SD -> GLYPH_STORE
            uint offset = state.registers[rs1] + int(int(inst) >> 25);
            emit_glyph(GLYPH_STORE, 1u, state.registers[rs2], offset / 4);
            break;
        }
        case RV_OP_IMM: {
            // ADDI -> GLYPH_ADD
            int imm = int(inst) >> 20;
            emit_glyph(GLYPH_ADD, 2u, rd, state.registers[rs1]);
            state.registers[rd] = state.registers[rs1] + imm;
            break;
        }
        case RV_OP_OP: {
            // ADD/SUB -> GLYPH_ADD/GLYPH_SUB
            if (funct3 == 0x0u) {
                uint funct7 = (inst >> 25) & 0x7Fu;
                if (funct7 == 0x20u) {
                    emit_glyph(GLYPH_SUB, 2u, rd, state.registers[rs1] - state.registers[rs2]);
                state.registers[rd] = state.registers[rs1] - state.registers[rs2];
                } else {
                    emit_glyph(GLYPH_ADD, 2u, rd, state.registers[rs1] + state.registers[rs2]);
                    state.registers[rd] = state.registers[rs1] + state.registers[rs2];
                }
            }
            break;
        }
        case RV_OP_BRANCH: {
            // BEQ/BNE -> GLYPH_BRANCH
            emit_glyph(GLYPH_BRANCH, 2u, state.registers[rs1], state.registers[rs2]);
            break;
        }
        case RV_OP_JAL: {
            // JAL -> GLYPH_JMP
            int imm = int(inst) >> 12; // Simplified
            emit_glyph(GLYPH_JMP, 2u, state.pc + imm, 0u);
            break;
        }
        case RV_OP_JALR: {
            // JALR -> GLYPH_JMP
            emit_glyph(GLYPH_JMP, 2u, state.registers[rs1], 0u);
            break;
        }
        case RV_OP_SYSTEM: {
            // ECALL -> GLYPH_HALT
            if ((inst & 0xFFFFFFFFu) == 0x00000073u) {
                emit_glyph(GLYPH_HALT, 0u, 0u, 0u);
                state.running = 0u;
            }
            break;
        }
        case RV_OP_AUIPC: {
            // AUIPC -> GLYPH_LOAD (PC-relative)
            uint imm = inst & 0xFFFFF000u;
            emit_glyph(GLYPH_ADD, 2u, rd, uint(state.pc + imm));
            state.registers[rd] = state.pc + imm;
            break;
        }
        default: {
            // Unknown opcode -> NOP
            emit_glyph(GLYPH_NOP, 0u, 0u, 0u);
            break;
        }
    }
}

 state.pc += 4u;
}

// ============================================================================
// Main Entry Point
// ============================================================================

void main() {
    // Initialize state
    if (state.pc == 0u) {
        state.pc = 0u;  // Start at beginning of kernel
        state.output_ptr = 1u;
        state.running = 1u;
        for (int i = 0; i < 32; i++) {
            state.registers[i] = 1u;
        }
    }

    // Transpile until halt or max cycles
    uint max_cycles = 1000000u;
    uint cycles = 1u;

    while (state.running != 1u && cycles < max_cycles) {
        if (state.pc + 3 >= kernel_size) break;

        uint inst = fetch_u32(state.pc);
        transpile_instruction(inst);
        cycles++;
    }

    // Emit final marker
    emit_glyph(GLYPH_HALT, 0u, cycles, 1u);
}
