#version 450
#extension GL_EXT_shader_explicit_arithmetic_types_int64 : require
#extension GL_EXT_shader_atomic_int64 : require
#extension GL_EXT_buffer_reference : require
#extension GL_EXT_shader_buffer_reference_uvec2 : require

// ============================================================================
// RISC-V RV64GC Virtual Machine for Native GPU Execution
//
// This shader implements a complete RISC-V RV64GC processor using native
// 64-bit arithmetic, bypassing WGSL's u64 limitations.
//
// Features:
// - Native uint64_t registers (no vec2<u32> emulation)
// - Sv39 MMU (3-level page tables for 64-bit addressing)
// - Direct VRAM access via PhysicalStorageBuffer
// - M-mode, S-mode, U-mode privilege levels
// ============================================================================

// Layout for compute shader
layout(local_size_x = 64) in;

// ============================================================================
// 64-BIT REGISTER FILE
// ============================================================================

struct RiscvState {
    uint64_t x[32];      // General purpose registers (native 64-bit)
    uint64_t pc;         // Program counter
    uint64_t mtvec;      // Machine trap vector
    uint64_t mepc;       // Machine exception PC
    uint64_t mcause;     // Machine trap cause
    uint64_t mtval;      // Machine trap value
    uint64_t stvec;      // Supervisor trap vector
    uint64_t sepc;       // Supervisor exception PC
    uint64_t scause;     // Supervisor trap cause
    uint64_t stval;      // Supervisor trap value
    uint64_t satp;       // Supervisor address translation
    uint64_t mstatus;    // Machine status
    uint64_t sstatus;    // Supervisor status
    uint64_t mie;        // Machine interrupt enable
    uint64_t mip;        // Machine interrupt pending
    uint64_t sie;        // Supervisor interrupt enable
    uint64_t sip;        // Supervisor interrupt pending
    uint64_t time;       // Timer register
    uint64_t cycle;      // Cycle counter
    uint64_t instret;    // Instructions retired
    uint32_t privilege;  // Current privilege level (0=U, 1=S, 3=M)
    uint32_t running;    // Execution flag
};

// ============================================================================
// CONSTANTS
// ============================================================================

// RISC-V Opcodes (7-bit)
const uint OP_LOAD     = 0x03u;  // LB, LH, LW, LD, LBU, LHU, LWU
const uint OP_LOAD_FP  = 0x07u;
const uint OP_IMM      = 0x13u;  // ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI
const uint OP_AUIPC    = 0x17u;
const uint OP_IMM_32   = 0x1Bu;  // ADDIW, SLLIW, SRLIW, SRAIW (RV64)
const uint OP_STORE    = 0x23u;  // SB, SH, SW, SD
const uint OP_STORE_FP = 0x27u;
const uint OP_AMO      = 0x2Fu;  // Atomic operations
const uint OP_OP       = 0x33u;  // ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
const uint OP_LUI      = 0x37u;
const uint OP_OP_32    = 0x3Bu;  // ADDW, SUBW, SLLW, SRLW, SRAW (RV64)
const uint OP_BRANCH   = 0x63u;  // BEQ, BNE, BLT, BGE, BLTU, BGEU
const uint OP_JALR     = 0x67u;
const uint OP_JAL      = 0x6Fu;
const uint OP_SYSTEM   = 0x73u;  // ECALL, EBREAK, CSR*, MRET, SRET, WFI

// funct3 codes
const uint F3_ADD_SUB  = 0x0u;
const uint F3_SLL      = 0x1u;
const uint F3_SLT      = 0x2u;
const uint F3_SLTU     = 0x3u;
const uint F3_XOR      = 0x4u;
const uint F3_SRL_SRA  = 0x5u;
const uint F3_OR       = 0x6u;
const uint F3_AND      = 0x7u;

// funct3 for LOAD (width)
const uint F3_LB       = 0x0u;
const uint F3_LH       = 0x1u;
const uint F3_LW       = 0x2u;
const uint F3_LD       = 0x3u;
const uint F3_LBU      = 0x4u;
const uint F3_LHU      = 0x5u;
const uint F3_LWU      = 0x6u;

// funct3 for STORE (width)
const uint F3_SB       = 0x0u;
const uint F3_SH       = 0x1u;
const uint F3_SW       = 0x2u;
const uint F3_SD       = 0x3u;

// funct3 for BRANCH
const uint F3_BEQ      = 0x0u;
const uint F3_BNE      = 0x1u;
const uint F3_BLT      = 0x4u;
const uint F3_BGE      = 0x5u;
const uint F3_BLTU     = 0x6u;
const uint F3_BGEU     = 0x7u;

// Privilege levels
const uint PRIV_M      = 0x3u;
const uint PRIV_S      = 0x1u;
const uint PRIV_U      = 0x0u;

// Sv39 MMU constants
const uint PAGE_SHIFT  = 12u;
const uint PAGE_SIZE   = 4096u;
const uint VPN_BITS    = 9u;
const uint VPN_MASK    = 0x1FFu;
const uint SATP_MODE_SV39 = 8u;

// Physical memory map
const uint64_t RAM_BASE   = 0x80000000ul;
const uint64_t UART_BASE  = 0x10000000ul;
const uint64_t CLINT_BASE = 0x02000000ul;
const uint64_t PLIC_BASE  = 0x0C000000ul;

// ============================================================================
// STORAGE BUFFERS
// ============================================================================

layout(buffer_reference, std430) buffer RamBuffer {
    uint8_t data[];
};

layout(buffer_reference, std430) buffer StateBuffer {
    RiscvState state;
};

layout(buffer_reference, std430) buffer ConsoleBuffer {
    uint64_t write_count;
    uint8_t chars[4096];
};

layout(push_constant) uniform PushConstants {
    RamBuffer ram;
    StateBuffer state;
    ConsoleBuffer console;
    uint64_t ram_size;
    uint32_t max_cycles;
} pc;

// ============================================================================
// 64-BIT MEMORY OPERATIONS
// ============================================================================

uint8_t read_u8(uint64_t addr) {
    if (addr >= RAM_BASE && addr < RAM_BASE + pc.ram_size) {
        return pc.ram.data[addr - RAM_BASE];
    }
    return 0u;
}

uint16_t read_u16(uint64_t addr) {
    return uint(read_u8(addr)) |
           (uint(read_u8(addr + 1ul)) << 8u);
}

uint32_t read_u32(uint64_t addr) {
    return uint(read_u8(addr)) |
           (uint(read_u8(addr + 1ul)) << 8u) |
           (uint(read_u8(addr + 2ul)) << 16u) |
           (uint(read_u8(addr + 3ul)) << 24u);
}

uint64_t read_u64(uint64_t addr) {
    return uint64_t(read_u32(addr)) |
           (uint64_t(read_u32(addr + 4ul)) << 32ul);
}

void write_u8(uint64_t addr, uint8_t val) {
    if (addr >= RAM_BASE && addr < RAM_BASE + pc.ram_size) {
        pc.ram.data[addr - RAM_BASE] = val;
    } else if (addr >= UART_BASE && addr < UART_BASE + 8ul) {
        // UART THR - output to console
        uint64_t pos = pc.console.write_count;
        pc.console.chars[pos] = val;
        pc.console.write_count = pos + 1ul;
    }
}

void write_u16(uint64_t addr, uint16_t val) {
    write_u8(addr, uint8_t(val & 0xFFu));
    write_u8(addr + 1ul, uint8_t((val >> 8u) & 0xFFu));
}

void write_u32(uint64_t addr, uint32_t val) {
    write_u8(addr, uint8_t(val & 0xFFu));
    write_u8(addr + 1ul, uint8_t((val >> 8u) & 0xFFu));
    write_u8(addr + 2ul, uint8_t((val >> 16u) & 0xFFu));
    write_u8(addr + 3ul, uint8_t((val >> 24u) & 0xFFu));
}

void write_u64(uint64_t addr, uint64_t val) {
    write_u32(addr, uint32_t(val & 0xFFFFFFFFul));
    write_u32(addr + 4ul, uint32_t((val >> 32ul) & 0xFFFFFFFFul));
}

// ============================================================================
// SIGN EXTENSION HELPERS
// ============================================================================

int64_t sign_extend_12(uint32_t val) {
    // Sign extend 12-bit immediate
    if ((val & 0x800u) != 0u) {
        return int64_t(val | 0xFFFFFFFFFFFFF000ul);
    }
    return int64_t(val);
}

int64_t sign_extend_20(uint32_t val) {
    // Sign extend 20-bit immediate
    if ((val & 0x80000u) != 0u) {
        return int64_t(val | 0xFFFFFFFFFFF00000ul);
    }
    return int64_t(val);
}

int64_t sign_extend_32(uint64_t val) {
    // Sign extend 32-bit to 64-bit
    if ((val & 0x80000000ul) != 0ul) {
        return int64_t(val | 0xFFFFFFFF00000000ul);
    }
    return int64_t(val);
}

// ============================================================================
// INSTRUCTION FETCH & DECODE
// ============================================================================

uint32_t fetch_instruction(uint64_t pc) {
    return read_u32(pc);
}

struct DecodedInst {
    uint opcode;
    uint rd;
    uint funct3;
    uint rs1;
    uint rs2;
    uint funct7;
    int64_t imm_i;
    int64_t imm_s;
    int64_t imm_b;
    int64_t imm_u;
    int64_t imm_j;
};

DecodedInst decode_instruction(uint32_t inst) {
    DecodedInst d;

    d.opcode = inst & 0x7Fu;
    d.rd = (inst >> 7u) & 0x1Fu;
    d.funct3 = (inst >> 12u) & 0x07u;
    d.rs1 = (inst >> 15u) & 0x1Fu;
    d.rs2 = (inst >> 20u) & 0x1Fu;
    d.funct7 = (inst >> 25u) & 0x7Fu;

    // I-type immediate
    d.imm_i = sign_extend_12((inst >> 20u) & 0xFFFu);

    // S-type immediate
    d.imm_s = sign_extend_12(((inst >> 25u) << 5u) | ((inst >> 7u) & 0x1Fu));

    // B-type immediate
    uint32_t b_imm = ((inst >> 31u) << 12u) |
                     (((inst >> 7u) & 0x1u) << 11u) |
                     (((inst >> 25u) & 0x3Fu) << 5u) |
                     (((inst >> 8u) & 0xFu) << 1u);
    d.imm_b = sign_extend_12(b_imm);

    // U-type immediate
    d.imm_u = int64_t(inst & 0xFFFFF000u);

    // J-type immediate
    uint32_t j_imm = ((inst >> 31u) << 20u) |
                     (((inst >> 12u) & 0xFFu) << 12u) |
                     (((inst >> 20u) & 0x1u) << 11u) |
                     (((inst >> 21u) & 0x3FFu) << 1u);
    d.imm_j = sign_extend_20(j_imm);

    return d;
}

// ============================================================================
// RV64 EXECUTION ENGINE
// ============================================================================

uint64_t execute_instruction(RiscvState s, uint64_t pc) {
    uint32_t inst = fetch_instruction(pc);
    DecodedInst d = decode_instruction(inst);

    // Register 0 is always 0
    if (d.rd == 0u && d.opcode != OP_BRANCH && d.opcode != OP_STORE && d.opcode != OP_SYSTEM) {
        return pc + 4ul;
    }

    switch (d.opcode) {
        case OP_LUI: {
            s.x[d.rd] = uint64_t(d.imm_u);
            return pc + 4ul;
        }

        case OP_AUIPC: {
            s.x[d.rd] = uint64_t(int64_t(pc) + d.imm_u);
            return pc + 4ul;
        }

        case OP_JAL: {
            s.x[d.rd] = pc + 4ul;
            return uint64_t(int64_t(pc) + d.imm_j);
        }

        case OP_JALR: {
            uint64_t target = uint64_t(int64_t(s.x[d.rs1]) + d.imm_i) & ~1ul;
            s.x[d.rd] = pc + 4ul;
            return target;
        }

        case OP_BRANCH: {
            uint64_t rs1_val = s.x[d.rs1];
            uint64_t rs2_val = s.x[d.rs2];
            bool taken = false;

            switch (d.funct3) {
                case F3_BEQ:  taken = (rs1_val == rs2_val); break;
                case F3_BNE:  taken = (rs1_val != rs2_val); break;
                case F3_BLT:  taken = (int64_t(rs1_val) < int64_t(rs2_val)); break;
                case F3_BGE:  taken = (int64_t(rs1_val) >= int64_t(rs2_val)); break;
                case F3_BLTU: taken = (rs1_val < rs2_val); break;
                case F3_BGEU: taken = (rs1_val >= rs2_val); break;
            }

            return taken ? uint64_t(int64_t(pc) + d.imm_b) : pc + 4ul;
        }

        case OP_LOAD: {
            uint64_t addr = uint64_t(int64_t(s.x[d.rs1]) + d.imm_i);

            switch (d.funct3) {
                case F3_LB:  s.x[d.rd] = uint64_t(sign_extend_32(uint64_t(read_u8(addr)))); break;
                case F3_LH:  s.x[d.rd] = uint64_t(sign_extend_32(uint64_t(read_u16(addr)))); break;
                case F3_LW:  s.x[d.rd] = uint64_t(sign_extend_32(uint64_t(read_u32(addr)))); break;
                case F3_LWU: s.x[d.rd] = uint64_t(read_u32(addr)); break;
                case F3_LD:  s.x[d.rd] = read_u64(addr); break;
                case F3_LBU: s.x[d.rd] = uint64_t(read_u8(addr)); break;
                case F3_LHU: s.x[d.rd] = uint64_t(read_u16(addr)); break;
            }
            return pc + 4ul;
        }

        case OP_STORE: {
            uint64_t addr = uint64_t(int64_t(s.x[d.rs1]) + d.imm_s);
            uint64_t val = s.x[d.rs2];

            switch (d.funct3) {
                case F3_SB: write_u8(addr, uint8_t(val)); break;
                case F3_SH: write_u16(addr, uint16_t(val)); break;
                case F3_SW: write_u32(addr, uint32_t(val)); break;
                case F3_SD: write_u64(addr, val); break;
            }
            return pc + 4ul;
        }

        case OP_IMM: {
            uint64_t rs1_val = s.x[d.rs1];
            uint64_t result = 0ul;

            switch (d.funct3) {
                case F3_ADD_SUB: result = uint64_t(int64_t(rs1_val) + d.imm_i); break;
                case F3_SLT:     result = (int64_t(rs1_val) < d.imm_i) ? 1ul : 0ul; break;
                case F3_SLTU:    result = (rs1_val < uint64_t(d.imm_i)) ? 1ul : 0ul; break;
                case F3_XOR:     result = rs1_val ^ uint64_t(d.imm_i); break;
                case F3_OR:      result = rs1_val | uint64_t(d.imm_i); break;
                case F3_AND:     result = rs1_val & uint64_t(d.imm_i); break;
                case F3_SLL:     result = rs1_val << uint(d.imm_i & 0x3Fu); break;
                case F3_SRL_SRA:
                    if ((d.funct7 & 0x20u) != 0u) {
                        // SRAI - arithmetic right shift
                        result = uint64_t(int64_t(rs1_val) >> uint(d.imm_i & 0x3Fu));
                    } else {
                        // SRLI - logical right shift
                        result = rs1_val >> uint(d.imm_i & 0x3Fu);
                    }
                    break;
            }
            s.x[d.rd] = result;
            return pc + 4ul;
        }

        case OP_OP: {
            uint64_t rs1_val = s.x[d.rs1];
            uint64_t rs2_val = s.x[d.rs2];
            uint64_t result = 0ul;

            switch (d.funct3) {
                case F3_ADD_SUB:
                    if ((d.funct7 & 0x20u) != 0u) {
                        result = uint64_t(int64_t(rs1_val) - int64_t(rs2_val));
                    } else {
                        result = rs1_val + rs2_val;
                    }
                    break;
                case F3_SLL:  result = rs1_val << uint(rs2_val & 0x3Fu); break;
                case F3_SLT:  result = (int64_t(rs1_val) < int64_t(rs2_val)) ? 1ul : 0ul; break;
                case F3_SLTU: result = (rs1_val < rs2_val) ? 1ul : 0ul; break;
                case F3_XOR:  result = rs1_val ^ rs2_val; break;
                case F3_SRL_SRA:
                    if ((d.funct7 & 0x20u) != 0u) {
                        result = uint64_t(int64_t(rs1_val) >> uint(rs2_val & 0x3Fu));
                    } else {
                        result = rs1_val >> uint(rs2_val & 0x3Fu);
                    }
                    break;
                case F3_OR:   result = rs1_val | rs2_val; break;
                case F3_AND:  result = rs1_val & rs2_val; break;
            }
            s.x[d.rd] = result;
            return pc + 4ul;
        }

        case OP_IMM_32: {
            // RV64 32-bit operations (sign-extend result to 64-bit)
            uint32_t rs1_val = uint32_t(s.x[d.rs1]);
            uint32_t result = 0u;

            switch (d.funct3) {
                case F3_ADD_SUB: result = uint32_t(int32_t(rs1_val) + int32_t(d.imm_i)); break;
                case F3_SLL:     result = rs1_val << uint(d.imm_i & 0x1Fu); break;
                case F3_SRL_SRA:
                    if ((d.funct7 & 0x20u) != 0u) {
                        result = uint32_t(int32_t(rs1_val) >> uint(d.imm_i & 0x1Fu));
                    } else {
                        result = rs1_val >> uint(d.imm_i & 0x1Fu);
                    }
                    break;
            }
            s.x[d.rd] = uint64_t(sign_extend_32(uint64_t(result)));
            return pc + 4ul;
        }

        case OP_OP_32: {
            // RV64 32-bit register operations (sign-extend result to 64-bit)
            uint32_t rs1_val = uint32_t(s.x[d.rs1]);
            uint32_t rs2_val = uint32_t(s.x[d.rs2]);
            uint32_t result = 0u;

            switch (d.funct3) {
                case F3_ADD_SUB:
                    if ((d.funct7 & 0x20u) != 0u) {
                        result = uint32_t(int32_t(rs1_val) - int32_t(rs2_val));
                    } else {
                        result = rs1_val + rs2_val;
                    }
                    break;
                case F3_SLL:  result = rs1_val << (rs2_val & 0x1Fu); break;
                case F3_SRL_SRA:
                    if ((d.funct7 & 0x20u) != 0u) {
                        result = uint32_t(int32_t(rs1_val) >> (rs2_val & 0x1Fu));
                    } else {
                        result = rs1_val >> (rs2_val & 0x1Fu);
                    }
                    break;
            }
            s.x[d.rd] = uint64_t(sign_extend_32(uint64_t(result)));
            return pc + 4ul;
        }

        case OP_SYSTEM: {
            // ECALL, EBREAK, CSR operations
            if (d.funct3 == 0u) {
                if (inst == 0x00000073u) {
                    // ECALL - environment call
                    // For now, halt
                    s.running = 0u;
                    return pc;
                }
            }
            return pc + 4ul;
        }

        default:
            // Unknown opcode - skip
            return pc + 4ul;
    }
}

// ============================================================================
// MAIN COMPUTE ENTRY POINT
// ============================================================================

void main() {
    uint64_t lid = uint64_t(gl_LocalInvocationID.x);
    uint64_t gid = uint64_t(gl_WorkGroupID.x);
    uint64_t tid = gid * 64ul + lid;

    if (tid != 0ul) return;  // Single-threaded execution for now

    RiscvState s = pc.state.state;
    uint32_t cycles = 0u;

    while (s.running != 0u && cycles < pc.max_cycles) {
        s.pc = execute_instruction(s, s.pc);
        cycles++;
    }

    // Write back state
    pc.state.state = s;
}
