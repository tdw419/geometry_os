# RISC-V Emulator Opcode Coverage

**File:** `systems/glyph_stratum/programs/riscv_emulator.glyph`
**Last Audited:** 2026-03-15
**Architecture:** RV32I (base) + RV32C (compressed subset)

## Overview

The RISC-V emulator runs on the Glyph VM and executes guest RISC-V programs. It implements a subset of RV32I base instructions and a minimal set of compressed (RV32C) instructions for code density.

---

## RV32I Base Integer Instructions

### Opcode 0x37: LUI (Load Upper Immediate)

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| LUI | ✅ | `:handle_lui` | Loads 20-bit immediate into upper bits |

### Opcode 0x17: AUIPC (Add Upper Immediate to PC)

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| AUIPC | ✅ | `:handle_auipc` | PC-relative addressing support |

### Opcode 0x6F: JAL (Jump and Link)

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| JAL | ✅ | `:handle_jal` | Full J-type immediate decoding |

### Opcode 0x67: JALR (Jump and Link Register)

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| JALR | ✅ | `:handle_jalr` | I-type, returns PC+1 to rd |

### Opcode 0x63: Branch Instructions

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| BEQ | ✅ | `:handle_beq` | Branch if equal |
| BNE | ✅ | `:handle_bne` | Branch if not equal |
| BLT | ❌ | - | Not implemented |
| BGE | ❌ | - | Not implemented |
| BLTU | ❌ | - | Not implemented |
| BGEU | ❌ | - | Not implemented |

### Opcode 0x03: Load Instructions

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| LB | ❌ | - | Not implemented |
| LH | ❌ | - | Not implemented |
| LW | ✅ | `:handle_load` | 32-bit load, UART bypass at 0x1000 |
| LBU | ❌ | - | Not implemented |
| LHU | ❌ | - | Not implemented |

### Opcode 0x23: Store Instructions

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| SB | ❌ | - | Not implemented |
| SH | ❌ | - | Not implemented |
| SW | ✅ | `:handle_store` | 32-bit store, UART TX at 0x1000 |
| -- | ✅ | `:handle_uart_tx_store` | Special case for UART output |

### Opcode 0x13: OP-IMM (Immediate Arithmetic)

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| ADDI | ✅ | `:imm_addi` | Add immediate |
| SLTI | ❌ | - | Not implemented |
| SLTIU | ❌ | - | Not implemented |
| XORI | ✅ | `:imm_xori` | XOR immediate |
| ORI | ✅ | `:imm_ori` | OR immediate |
| ANDI | ✅ | `:imm_andi` | AND immediate |
| SLLI | ❌ | - | Not implemented |
| SRLI | ❌ | - | Not implemented |
| SRAI | ❌ | - | Not implemented |

### Opcode 0x33: OP-REG (Register Arithmetic)

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| ADD | ✅ | `:reg_add_sub` | Register addition |
| SUB | ✅ | `:reg_do_sub` | Register subtraction (funct7=0x20) |
| SLL | ❌ | - | Not implemented |
| SLT | ❌ | - | Not implemented |
| SLTU | ❌ | - | Not implemented |
| XOR | ✅ | `:reg_xor` | Register XOR |
| SRL | ❌ | - | Not implemented |
| SRA | ❌ | - | Not implemented |
| OR | ✅ | `:reg_or` | Register OR |
| AND | ✅ | `:reg_and` | Register AND |

### Opcode 0x73: SYSTEM

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| ECALL | ✅ | `:handle_ecall` | Traps with code 11 |
| EBREAK | ❌ | - | Not implemented |
| CSRRW | ⚠️ | `:handle_system` | Partial - CSR read/write only |

---

## RV32C Compressed Instructions

### Quadrant 0 (C0)

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| C.ADDI4SPN | ❌ | - | Not implemented |
| C.LW | ⚠️ | `:handle_c_lw` | Label exists, falls through to fetch |
| C.SW | ⚠️ | `:handle_c_sw` | Label exists, falls through to fetch |
| C.FLD | ❌ | - | Not implemented (FP) |
| C.FSD | ❌ | - | Not implemented (FP) |

### Quadrant 1 (C1)

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| C.ADDI | ✅ | `:handle_c_addi` | Add immediate to register |
| C.JAL | ❌ | - | Not implemented (RV32C-specific) |
| C.LI | ✅ | `:handle_c_li` | Load immediate |
| C.ADDI16SP | ❌ | - | Not implemented |
| C.LUI | ❌ | - | Not implemented |
| C.SRLI | ❌ | - | Not implemented |
| C.SRAI | ❌ | - | Not implemented |
| C.ANDI | ❌ | - | Not implemented |
| C.SUB | ❌ | - | Not implemented |
| C.XOR | ❌ | - | Not implemented |
| C.OR | ❌ | - | Not implemented |
| C.AND | ❌ | - | Not implemented |
| C.J | ❌ | - | Not implemented |
| C.BEQZ | ❌ | - | Not implemented |
| C.BNEZ | ❌ | - | Not implemented |

### Quadrant 2 (C2)

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| C.SLLI | ❌ | - | Not implemented |
| C.LWSP | ❌ | - | Not implemented |
| C.SWSP | ❌ | - | Not implemented |
| C.JR | ❌ | - | Not implemented |
| C.MV | ❌ | - | Not implemented |
| C.EBREAK | ❌ | - | Not implemented |
| C.JALR | ❌ | - | Not implemented |
| C.ADD | ❌ | - | Not implemented |
| C.FLDSP | ❌ | - | Not implemented (FP) |
| C.FSDSP | ❌ | - | Not implemented (FP) |

---

## RV32M Multiply Extension

| Instruction | Status | Glyph Label | Notes |
|-------------|--------|-------------|-------|
| MUL | ❌ | - | Not implemented |
| MULH | ❌ | - | Not implemented |
| MULHSU | ❌ | - | Not implemented |
| MULHU | ❌ | - | Not implemented |
| DIV | ❌ | - | Not implemented |
| DIVU | ❌ | - | Not implemented |
| REM | ❌ | - | Not implemented |
| REMU | ❌ | - | Not implemented |

---

## Memory Layout

| Address | Purpose |
|---------|---------|
| 0x0200 | UART output buffer |
| 0x0300 | Timer counter |
| 0x0308 | Timer compare |
| 0x1000 | UART MMIO (guest address) |
| 0x14000 | GUEST_PC (current program counter) |
| 0x14001 | GUEST_HW_FLAG (halfword alignment flag) |
| 0x14100 | GUEST_REGS (x0-x31, each 4 bytes) |
| 0x14300 | CSR_BASE (Control Status Registers) |
| 0x14341 | MTVAL (trap value) |
| 0x14342 | MCAUSE (trap cause) |
| 0x18000 | GUEST_RAM (RISC-V code starts here) |

---

## Trap Handling

| Trap | Code | Handler | Notes |
|------|------|---------|-------|
| Timer IRQ | 7 | `:trigger_timer_irq` | Timer compare match |
| ECALL | 11 | `:handle_ecall` | System call |

Trap handler saves PC to MTVAL, cause to MCAUSE, then jumps to MTVEC.

---

## Coverage Summary

| Category | Implemented | Total | Coverage |
|----------|-------------|-------|----------|
| RV32I Base | 19 | 40 | 47.5% |
| RV32C Compressed | 2 | 28 | 7.1% |
| RV32M Multiply | 0 | 8 | 0% |

### Critical Gaps

1. **Shifts Missing** - SLLI, SRLI, SRAI, SLL, SRL, SRA not implemented
2. **Set-Less-Than Missing** - SLTI, SLTIU, SLT, SLTU not implemented
3. **Byte/Halfword Access** - Only LW/SW supported, no LB/LH/LBU/LHU/SB/SH
4. **Branch Variants** - Only BEQ/BNE, missing BLT/BGE/BLTU/BGEU
5. **Compressed Memory** - C.LW/C.SW labels exist but fall through to fetch
6. **Multiply/Divide** - No RV32M support

### Priority for Self-Hosting

To compile simple C/Rust programs, prioritize:
1. Shift instructions (SLLI, SRLI, SRAI)
2. Set-less-than (SLTI, SLT)
3. Unsigned branches (BLTU, BGEU)
4. Byte loads (LBU, LB) for string operations

---

## Glyph VM Register Allocation

| Register | Purpose |
|----------|---------|
| r0 | Entry point (passed by scheduler) |
| r1-r9 | Temporaries |
| r10 | GUEST_PC address (0x14000) |
| r11 | Instruction fetch temporary |
| r12 | UART address (0x0200) |
| r13 | Current instruction |
| r14-r19 | Decode temporaries |
| r20-r31 | Guest register cache / work regs |
| r100 | Guest PC value |
| r101 | Instruction word |
| r102 | Opcode |
| r103 | rd (destination register) |
| r104 | rs1 (source register 1) |
| r105 | rs2 (source register 2) |
| r106 | Immediate value |
| r107 | Halfword flag |

---

*Generated from source audit of riscv_emulator.glyph*
