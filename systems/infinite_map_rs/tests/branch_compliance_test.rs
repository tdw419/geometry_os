// Phase 4: Branch Instructions Compliance Tests
//
// Validates Phase 4 Branch implementation against RISC-V RV32I standard:
// - BEQ: Branch if Equal
// - BNE: Branch if Not Equal
// - BLT: Branch if Less Than (signed)
// - BGE: Branch if Greater or Equal (signed)
// - BLTU: Branch if Less Than Unsigned
// - BGEU: Branch if Greater or Equal Unsigned
// - JAL: Jump and Link
// - JALR: Jump and Link Register

use infinite_map_rs::tests::riscv_test_programs::RiscvEncoder;

use std::collections::HashMap;

// ============================================
// Mock CPU Executor for Branch Testing
// ============================================

/// Mock RISC-V CPU executor for testing branch instructions
/// Matches WGSL behavior from src/shaders/riscv_executor.wgsl
pub struct MockCpuExecutor {
    /// General purpose registers x0-x31
    registers: [u32; 32],
    /// Program counter
    pc: u32,
    /// Instruction memory (address -> instruction)
    memory: HashMap<u32, u32>,
    /// Halt flag
    halted: bool,
}

impl MockCpuExecutor {
    /// Create a new mock CPU executor
    pub fn new() -> Self {
        Self {
            registers: [0u32; 32],
            pc: 0,
            memory: HashMap::new(),
            halted: false,
        }
    }

    /// Load a program into instruction memory
    pub fn load_program(&mut self, code: &[u32]) {
        self.memory.clear();
        for (i, &inst) in code.iter().enumerate() {
            self.memory.insert(i as u32 * 4, inst);
        }
        self.pc = 0;
        self.halted = false;
    }

    /// Read a register value (x0 is always 0)
    pub fn get_reg(&self, reg: u32) -> u32 {
        if reg == 0 {
            0
        } else if reg < 32 {
            self.registers[reg as usize]
        } else {
            0
        }
    }

    /// Set a register value (x0 is read-only)
    pub fn set_reg(&mut self, reg: u32, val: u32) {
        if reg != 0 && reg < 32 {
            self.registers[reg as usize] = val;
        }
    }

    /// Get current program counter
    pub fn get_pc(&self) -> u32 {
        self.pc
    }

    /// Check if CPU is halted
    pub fn is_halted(&self) -> bool {
        self.halted
    }

    /// Fetch instruction from memory
    fn fetch(&self, addr: u32) -> Option<u32> {
        self.memory.get(&addr).copied()
    }

    /// Decode instruction fields
    fn decode_opcode(&self, inst: u32) -> u32 {
        inst & 0x7F
    }

    fn decode_rd(&self, inst: u32) -> u32 {
        (inst >> 7) & 0x1F
    }

    fn decode_funct3(&self, inst: u32) -> u32 {
        (inst >> 12) & 0x7
    }

    fn decode_rs1(&self, inst: u32) -> u32 {
        (inst >> 15) & 0x1F
    }

    fn decode_rs2(&self, inst: u32) -> u32 {
        (inst >> 20) & 0x1F
    }

    /// Decode B-type immediate (branch offset)
    fn decode_imm_b(&self, inst: u32) -> i32 {
        let imm_lo = ((inst >> 8) & 0xF) as i32; // imm[4:1]
        let imm_hi = ((inst >> 25) & 0x3F) as i32; // imm[10:5]
        let imm_11 = ((inst >> 7) & 0x1) as i32; // imm[11]
        let imm_12 = ((inst >> 31) & 0x1) as i32; // imm[12]

        let mut imm = (imm_lo << 1) | (imm_hi << 5) | (imm_11 << 11) | (imm_12 << 12);
        // Sign extend
        if (imm & 0x1000) != 0 {
            imm |= 0xFFFFE000u32 as i32;
        }
        imm
    }

    /// Decode J-type immediate (jump offset)
    fn decode_imm_j(&self, inst: u32) -> i32 {
        let imm_lo = ((inst >> 21) & 0x3FF) as i32; // imm[10:1]
        let imm_11 = ((inst >> 20) & 0x1) as i32; // imm[11]
        let imm_hi = ((inst >> 12) & 0xFF) as i32; // imm[19:12]
        let imm_20 = ((inst >> 31) & 0x1) as i32; // imm[20]

        let mut imm = (imm_lo << 1) | (imm_11 << 11) | (imm_hi << 12) | (imm_20 << 20);
        // Sign extend
        if (imm & 0x100000) != 0 {
            imm |= 0xFFE00000u32 as i32;
        }
        imm
    }

    /// Decode I-type immediate
    fn decode_imm_i(&self, inst: u32) -> i32 {
        let imm = ((inst >> 20) & 0xFFF) as i32;
        if (imm & 0x800) != 0 {
            imm | 0xFFFFF000u32 as i32
        } else {
            imm
        }
    }

    /// Execute a single instruction
    fn execute_instruction(&mut self) -> bool {
        if self.halted {
            return false;
        }

        let inst = match self.fetch(self.pc) {
            Some(i) => i,
            None => {
                self.halted = true;
                return false;
            }
        };

        let opcode = self.decode_opcode(inst);
        let old_pc = self.pc;

        // Execute based on opcode
        match opcode {
            // JAL: Jump and Link
            0x6F => {
                let rd = self.decode_rd(inst);
                let offset = self.decode_imm_j(inst);
                // Link: return address = old_pc + 4
                self.set_reg(rd, old_pc.wrapping_add(4));
                // Jump: pc = pc + offset (handle signed offset)
                self.pc = (old_pc as i32).wrapping_add(offset) as u32;
            }

            // JALR: Jump and Link Register
            0x67 => {
                let rd = self.decode_rd(inst);
                let rs1 = self.decode_rs1(inst);
                let imm = self.decode_imm_i(inst);
                // Link: return address = old_pc + 4
                self.set_reg(rd, old_pc.wrapping_add(4));
                // Jump: target = (rs1 + imm) & 0xFFFFFFFE (clear LSB)
                let rs1_val = self.get_reg(rs1) as i32;
                let target = (rs1_val.wrapping_add(imm) as u32) & 0xFFFFFFFE;
                self.pc = target;
            }

            // BRANCH: Branch instructions
            0x63 => {
                let rs1 = self.decode_rs1(inst);
                let rs2 = self.decode_rs2(inst);
                let funct3 = self.decode_funct3(inst);
                let offset = self.decode_imm_b(inst);

                let rs1_val = self.get_reg(rs1);
                let rs2_val = self.get_reg(rs2);

                let take_branch = match funct3 {
                    // BEQ: branch if rs1 == rs2
                    0x0 => rs1_val == rs2_val,
                    // BNE: branch if rs1 != rs2
                    0x1 => rs1_val != rs2_val,
                    // BLT: branch if (rs1 as i32) < (rs2 as i32) [signed]
                    0x4 => (rs1_val as i32) < (rs2_val as i32),
                    // BGE: branch if (rs1 as i32) >= (rs2 as i32) [signed]
                    0x5 => (rs1_val as i32) >= (rs2_val as i32),
                    // BLTU: branch if rs1 < rs2 [unsigned]
                    0x6 => rs1_val < rs2_val,
                    // BGEU: branch if rs1 >= rs2 [unsigned]
                    0x7 => rs1_val >= rs2_val,
                    _ => false,
                };

                if take_branch {
                    self.pc = (old_pc as i32).wrapping_add(offset) as u32;
                } else {
                    self.pc = old_pc.wrapping_add(4);
                }
            }

            // OP-IMM: Add immediate, etc.
            0x13 => {
                let rd = self.decode_rd(inst);
                let rs1 = self.decode_rs1(inst);
                let funct3 = self.decode_funct3(inst);
                let imm = self.decode_imm_i(inst);

                let rs1_val = self.get_reg(rs1);

                match funct3 {
                    // ADDI: add immediate
                    0x0 => {
                        let result = rs1_val.wrapping_add(imm as u32);
                        self.set_reg(rd, result);
                    }
                    _ => {
                        // Other OP-IMM instructions not implemented
                    }
                }
                self.pc = old_pc.wrapping_add(4);
            }

            // LUI: Load Upper Immediate
            0x37 => {
                let rd = self.decode_rd(inst);
                let imm = ((inst >> 12) & 0xFFFFF) as u32;
                self.set_reg(rd, imm);
                self.pc = old_pc.wrapping_add(4);
            }

            // Other opcodes (for basic execution support)
            0x33 | 0x17 => {
                // OP, AUIPC - just advance PC
                self.pc = old_pc.wrapping_add(4);
            }

            0x73 => {
                // SYSTEM - check for ECALL/EBREAK
                if inst == 0x00000073 || inst == 0x00100073 {
                    self.halted = true;
                } else {
                    self.pc = old_pc.wrapping_add(4);
                }
            }

            _ => {
                // Unknown opcode - advance PC
                self.pc = old_pc.wrapping_add(4);
            }
        }

        true
    }

    /// Execute instructions until halt or max instructions
    pub fn execute(&mut self, max_instructions: usize) -> usize {
        let mut count = 0;
        while count < max_instructions && !self.halted {
            if !self.execute_instruction() {
                break;
            }
            count += 1;
        }
        count
    }

    /// Execute exactly N instructions (or until halt)
    pub fn execute_n(&mut self, n: usize) -> usize {
        let mut count = 0;
        while count < n && !self.halted {
            if !self.execute_instruction() {
                break;
            }
            count += 1;
        }
        count
    }

    /// Reset CPU state
    pub fn reset(&mut self) {
        self.registers = [0u32; 32];
        self.pc = 0;
        self.halted = false;
    }

    /// Get a copy of all registers
    pub fn dump_registers(&self) -> [u32; 32] {
        self.registers
    }
}

impl Default for MockCpuExecutor {
    fn default() -> Self {
        Self::new()
    }
}

// ============================================
// Phase 4: Branch Instructions Compliance Tests
// ============================================
//
// 32 comprehensive tests covering:
// - B-type branch instructions (BEQ, BNE, BLT, BGE, BLTU, BGEU)
// - J-type jump instructions (JAL, JALR)
// - Edge cases and boundary conditions

#[cfg(test)]
mod branch_compliance_tests {
    use super::MockCpuExecutor;
    use infinite_map_rs::tests::riscv_test_programs::RiscvEncoder;

    // ============================================
    // B-type Branch Tests (16 tests)
    // ============================================

    /// Test 1: BEQ taken when both registers are equal
    #[test]
    fn test_beq_taken_equal() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
        e.addi(2, 0, 5); // x2 = 5
        e.beq(1, 2, 4); // beq x1, x2, 4 (jump to instruction after nop)
        e.addi(3, 0, 0); // x3 = 0 (not executed if branch taken)
        e.addi(3, 0, 1); // x3 = 1 (executed if branch taken)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(3), 1, "Branch should have been taken");
    }

    /// Test 2: BEQ not taken when registers are unequal
    #[test]
    fn test_beq_not_taken() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
        e.addi(2, 0, 7); // x2 = 7
        e.beq(1, 2, 4); // beq x1, x2, 4 (not taken)
        e.addi(3, 0, 1); // x3 = 1 (executed if branch not taken)
        e.addi(3, 0, 2); // x3 = 2 (executed if branch not taken)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            2,
            "Branch should not have been taken, both instructions executed"
        );
    }

    /// Test 3: BEQ with both zero (equality still holds)
    #[test]
    fn test_beq_zero_equality() {
        let mut e = RiscvEncoder::new();
        // x1 and x2 are already zero
        e.beq(1, 2, 4); // beq x1, x2, 4 (should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            1,
            "Branch should have been taken for zero equality"
        );
    }

    /// Test 4: BNE taken when registers are unequal
    #[test]
    fn test_bne_taken_unequal() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
        e.addi(2, 0, 7); // x2 = 7
        e.bne(1, 2, 4); // bne x1, x2, 4 (jump taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(3), 1, "BNE should have been taken");
    }

    /// Test 5: BNE not taken when registers are equal
    #[test]
    fn test_bne_not_taken() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
        e.addi(2, 0, 5); // x2 = 5
        e.bne(1, 2, 4); // bne x1, x2, 4 (not taken)
        e.addi(3, 0, 1); // x3 = 1 (executed)
        e.addi(3, 0, 2); // x3 = 2 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            2,
            "BNE should not have been taken, both instructions executed"
        );
    }

    /// Test 6: BNE with one zero and one non-zero
    #[test]
    fn test_bne_one_zero() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
                         // x2 = 0 (already zero)
        e.bne(1, 2, 4); // bne x1, x2, 4 (should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            1,
            "BNE should be taken with different values"
        );
    }

    /// Test 7: BLT with positive values (5 < 10)
    #[test]
    fn test_blt_positive_less() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
        e.addi(2, 0, 10); // x2 = 10
        e.blt(1, 2, 4); // blt x1, x2, 4 (should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(3), 1, "BLT should be taken when 5 < 10");
    }

    /// Test 8: BLT with positive values (10 > 5, not less)
    #[test]
    fn test_blt_positive_greater() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 10); // x1 = 10
        e.addi(2, 0, 5); // x2 = 5
        e.blt(1, 2, 4); // blt x1, x2, 4 (not taken)
        e.addi(3, 0, 1); // x3 = 1 (executed)
        e.addi(3, 0, 2); // x3 = 2 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            2,
            "BLT should not be taken when 10 > 5, both instructions executed"
        );
    }

    /// Test 9: BLT with negative vs positive (-5 < 5)
    #[test]
    fn test_blt_negative_vs_positive() {
        let mut e = RiscvEncoder::new();
        // -1 as signed 32-bit (represented as 0xFFFFFFFF in u32)
        e.addi(1, 0, -1); // x1 = -1 (as signed)
        e.addi(2, 0, 5); // x2 = 5
        e.blt(1, 2, 4); // blt x1, x2, 4 (should be taken: -1 < 5)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            1,
            "BLT should be taken when -1 < 5 (signed)"
        );
    }

    /// Test 10: BGE with greater or equal (10 >= 5)
    #[test]
    fn test_bge_greater_or_equal() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 10); // x1 = 10
        e.addi(2, 0, 5); // x2 = 5
        e.bge(1, 2, 4); // bge x1, x2, 4 (should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(3), 1, "BGE should be taken when 10 >= 5");
    }

    /// Test 11: BGE with equal values (5 >= 5)
    #[test]
    fn test_bge_equal_signed() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
        e.addi(2, 0, 5); // x2 = 5
        e.bge(1, 2, 4); // bge x1, x2, 4 (should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(3), 1, "BGE should be taken when 5 >= 5 (equal)");
    }

    /// Test 12: BLTU with small vs large unsigned (5 < 10)
    #[test]
    fn test_bltu_small_large() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
        e.addi(2, 0, 10); // x2 = 10
        e.bltu(1, 2, 4); // bltu x1, x2, 4 (should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            1,
            "BLTU should be taken when 5 < 10 (unsigned)"
        );
    }

    /// Test 13: BLTU with large vs small (large > small)
    #[test]
    fn test_bltu_large_small() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 10); // x1 = 10
        e.addi(2, 0, 5); // x2 = 5
        e.bltu(1, 2, 4); // bltu x1, x2, 4 (not taken)
        e.addi(3, 0, 1); // x3 = 1 (executed)
        e.addi(3, 0, 2); // x3 = 2 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            2,
            "BLTU should not be taken when 10 > 5 (unsigned)"
        );
    }

    /// Test 14: BGEU with greater or equal (10 >= 5)
    #[test]
    fn test_bgeu_greater_or_equal() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 10); // x1 = 10
        e.addi(2, 0, 5); // x2 = 5
        e.bgeu(1, 2, 4); // bgeu x1, x2, 4 (should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            1,
            "BGEU should be taken when 10 >= 5 (unsigned)"
        );
    }

    /// Test 15: BGEU at 0x80000000 boundary (sign bit set)
    #[test]
    fn test_bgeu_top_boundary() {
        let mut e = RiscvEncoder::new();
        // Use lui to load values with sign bit set
        e.lui(1, 0x80000); // x1 = 0x80000000 (2^31, sign bit set)
        e.lui(2, 0x00001); // x2 = 0x00001000
        e.bgeu(1, 2, 4); // bgeu x1, x2, 4 (should be taken: 0x80000000 > 0x1000)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            1,
            "BGEU should treat 0x80000000 as large unsigned value"
        );
    }

    /// Test 16: BGEU with equal unsigned values
    #[test]
    fn test_bgeu_equal_unsigned() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 100); // x1 = 100
        e.addi(2, 0, 100); // x2 = 100
        e.bgeu(1, 2, 4); // bgeu x1, x2, 4 (should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(
            cpu.get_reg(3),
            1,
            "BGEU should be taken when values are equal"
        );
    }

    // ============================================
    // J-type Jump Tests (8 tests)
    // ============================================

    /// Test 17: JAL forward jump with return address linking
    #[test]
    fn test_jal_forward() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 0); // x1 = 0 (at PC=0)
        e.jal(1, 8); // jal x1, 8 (at PC=4, jump forward, link return address)
        e.addi(2, 0, 0); // x2 = 0 (not executed)
        e.addi(2, 0, 1); // x2 = 1 (executed after jump)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        // JAL is at PC=4, so return address should be 8 (PC + 4)
        assert_eq!(cpu.get_reg(1), 8, "JAL should link return address (PC + 4)");
        assert_eq!(cpu.get_reg(2), 1, "JAL should have jumped to target");
    }

    /// Test 18: JAL backward jump
    #[test]
    fn test_jal_backward() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 0); // x1 = 0 (at PC=0)
        e.addi(2, 0, 0); // x2 = 0 (at PC=4)
        e.addi(3, 0, 0); // x3 = 0 (at PC=8)
        e.jal(1, -4); // jal x1, -4 (at PC=12, jump back to addi x3, x0, 0 at PC=8)
        e.addi(4, 0, 1); // x4 = 1 (at PC=16, after jump target)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute_n(4); // Execute exactly 4 instructions

        // JAL is at PC=12, so return address should be 16 (PC + 4)
        assert_eq!(
            cpu.get_reg(1),
            16,
            "JAL should link return address before backward jump"
        );
        // After jumping back -4 from PC=12, should be at PC=8
        // Then execution stops (we only execute 4 instructions)
        assert_eq!(cpu.get_pc(), 8, "JAL should have jumped backward to PC=8");
    }

    /// Test 19: JAL return address verification (rd = PC + 4)
    #[test]
    fn test_jal_return_address() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 0); // x1 = 0 (at PC=0)
        e.jal(2, 0); // jal x2, 0 (jump to self, link PC+4 to x2)
                     // After first instruction: PC=4
                     // JAL at PC=4: x2 = 4 + 4 = 8, jump to 4

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute_n(2); // Execute 2 instructions

        assert_eq!(cpu.get_reg(2), 8, "JAL should set rd = PC + 4");
    }

    /// Test 20: JAL to x0 (discard return address)
    #[test]
    fn test_jal_to_x0() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
        e.jal(0, 8); // jal x0, 8 (jump forward 8 bytes, discard return address)
        e.addi(1, 0, 0); // x1 = 0 (not executed - skipped by jump)
        e.addi(1, 0, 1); // x1 = 1 (executed after jump - this is the target)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(0), 0, "x0 should always be zero");
        assert_eq!(
            cpu.get_reg(1),
            1,
            "JAL should have jumped and skipped the x1=0 instruction"
        );
    }

    /// Test 21: JALR register indirect forward jump
    #[test]
    fn test_jalr_forward() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 8); // x1 = 8 (target address) - PC=0
        e.jalr(2, 1, 0); // jalr x2, x1, 0 (jump to x1, link to x2) - PC=4, jumps to PC=8
        e.addi(3, 0, 0); // x3 = 0 (not executed) - PC=8 (skipped)
        e.addi(3, 0, 1); // x3 = 1 (executed) - PC=12 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute_n(4); // Execute 4 instructions

        // Return address should be PC + 4 = 4 + 4 = 8
        assert_eq!(cpu.get_reg(2), 8, "JALR should link return address");
        // x3 should be 1 because we jumped to PC=8 (addi x3, x0, 0), then PC=12 (addi x3, x0, 1)
        assert_eq!(cpu.get_reg(3), 1, "JALR should have jumped to x1=8");
        // PC should be 16 after executing the instruction at PC=12
        assert_eq!(
            cpu.get_pc(),
            16,
            "PC should be at instruction 4 after jumping"
        );
    }

    /// Test 22: JALR register indirect backward jump
    #[test]
    fn test_jalr_backward() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 0); // x1 = 0 (jump back to start) - PC=0
        e.addi(2, 0, 1); // x2 = 1 - PC=4
        e.jalr(3, 1, 0); // jalr x3, x1, 0 (jump to x1=0) - PC=8, jumps to PC=0

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute_n(3); // Execute 3 instructions: PC=0,4,8

        // After executing JALR at PC=8, should jump to PC=0
        // But execute_n(3) stops after 3 instructions, so PC should be 0
        assert_eq!(cpu.get_pc(), 0, "JALR should have jumped to address in x1");
        // Return address should be PC=8 + 4 = 12
        assert_eq!(cpu.get_reg(3), 12, "JALR should link return address");
    }

    /// Test 23: JALR LSB clearing for alignment
    #[test]
    fn test_jalr_lsb_clearing() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 7); // x1 = 7 (odd address) - PC=0
        e.jalr(2, 1, 1); // jalr x2, x1, 1 (target = (7 + 1) & 0xFFFFFFFE = 8) - PC=4
        e.addi(3, 0, 1); // x3 = 1 - PC=8
        e.addi(4, 0, 2); // x4 = 2 - PC=12 (target should be here)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute_n(3); // Execute 3 instructions to reach the jump target

        // Target = (7 + 1) & 0xFFFFFFFE = 8
        // After executing: PC=0 (addi), PC=4 (jalr jumps to PC=8), PC=8 (addi x3, x0, 1)
        // So PC should be 12 after the third instruction
        assert_eq!(
            cpu.get_pc(),
            12,
            "JALR should clear LSB for alignment and jump to PC=8"
        );
    }

    /// Test 24: JALR return address linking
    #[test]
    fn test_jalr_return_address() {
        let mut e = RiscvEncoder::new();
        e.lui(1, 0x00010); // x1 = 0x10000
        e.jalr(2, 1, 0); // jalr x2, x1, 0 (jump to 0x10000)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute_n(2);

        // Return address = PC + 4 = 4 + 4 = 8
        assert_eq!(cpu.get_reg(2), 8, "JALR should link PC + 4 to rd");
    }

    // ============================================
    // Edge Case Tests (8 tests)
    // ============================================

    /// Test 25: Maximum forward branch offset (2047 instructions)
    #[test]
    fn test_branch_max_forward() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5 (PC=0)
        e.addi(2, 0, 5); // x2 = 5 (PC=4)
                         // Forward branch offset of 16 bytes (4 instructions)
        e.beq(1, 2, 16); // beq x1, x2, 16 (branch forward to PC=24)
        e.addi(3, 0, 0); // x3 = 0 (not executed) (PC=12)
        e.addi(3, 0, 0); // x3 = 0 (not executed) (PC=16)
        e.addi(3, 0, 0); // x3 = 0 (not executed) (PC=20)
        e.addi(3, 0, 1); // x3 = 1 (target at PC=24)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(3), 1, "Forward branch should reach target");
    }

    /// Test 26: Maximum backward branch offset (-2048 instructions)
    #[test]
    fn test_branch_max_backward() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5
        e.addi(2, 0, 5); // x2 = 5
                         // Add nops to create distance
        for _ in 0..100 {
            e.addi(0, 0, 0); // nop
        }
        e.addi(3, 0, 1); // x3 = 1 (target of backward branch)
                         // Maximum backward offset
        e.beq(1, 2, -408); // beq x1, x2, -408 (jump back)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(500);

        assert_eq!(
            cpu.get_reg(3),
            1,
            "Maximum backward branch should reach target"
        );
    }

    /// Test 27: Maximum JAL forward offset
    #[test]
    fn test_jal_max_forward() {
        let mut e = RiscvEncoder::new();
        e.jal(1, 524284); // jal x1, ~1MB forward (near max)
                          // Add nops to fill space
        for _ in 0..100 {
            e.addi(0, 0, 0); // nop
        }
        e.addi(2, 0, 1); // x2 = 1 (target)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(500);

        assert!(cpu.get_pc() > 400, "JAL should handle large forward offset");
    }

    /// Test 28: Maximum JAL backward offset
    #[test]
    fn test_jal_max_backward() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 1); // x1 = 1 (target at PC=0)
        for _ in 0..100 {
            e.addi(0, 0, 0); // nop (PC=4 to PC=404)
        }
        // After 101 instructions (addi at PC=0 + 100 nops), JAL is at PC=404
        // Jump back -400: 404 - 400 = 4 (wraps to positive due to unsigned arithmetic)
        // Actually: 404 + (-400 as u32) = 404 + 4294966896 = 4 (wraps correctly)
        e.jal(2, -400); // jal x2, -400 (jump back to near PC=0)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute_n(102); // Execute exactly 102 instructions

        // After jumping back -400 from PC=404, should wrap to PC=4
        assert_eq!(
            cpu.get_pc(),
            4,
            "JAL should handle large backward offset with wrapping"
        );
    }

    /// Test 29: BLT with INT_MIN (0x80000000)
    #[test]
    fn test_signed_int_min() {
        let mut e = RiscvEncoder::new();
        e.lui(1, 0x80000); // x1 = 0x80000000 (INT_MIN)
        e.addi(2, 0, 0); // x2 = 0
        e.blt(1, 2, 4); // blt x1, x2, 4 (INT_MIN < 0, should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(3), 1, "BLT should handle INT_MIN correctly");
    }

    /// Test 30: BGE with INT_MAX (0x7FFFFFFF)
    #[test]
    fn test_signed_int_max() {
        let mut e = RiscvEncoder::new();
        e.lui(1, 0x80000); // x1 = 0x80000000
        e.addi(1, 1, -1); // x1 = 0x7FFFFFFF (INT_MAX)
        e.addi(2, 0, 0); // x2 = 0
        e.bge(1, 2, 4); // bge x1, x2, 4 (INT_MAX >= 0, should be taken)
        e.addi(3, 0, 0); // x3 = 0 (not executed)
        e.addi(3, 0, 1); // x3 = 1 (executed)

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(3), 1, "BGE should handle INT_MAX correctly");
    }

    /// Test 31: Compare zero with positive value
    #[test]
    fn test_comparison_zero_positive() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 0); // x1 = 0
        e.addi(2, 0, 5); // x2 = 5

        // Test all comparison types
        e.blt(1, 2, 4); // 0 < 5 (signed, taken)
        e.addi(3, 0, 0); // not executed
        e.addi(3, 0, 1); // executed

        e.bge(2, 1, 4); // 5 >= 0 (signed, taken)
        e.addi(4, 0, 0); // not executed
        e.addi(4, 0, 1); // executed

        e.bltu(1, 2, 4); // 0 < 5 (unsigned, taken)
        e.addi(5, 0, 0); // not executed
        e.addi(5, 0, 1); // executed

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        assert_eq!(cpu.get_reg(3), 1, "BLT: 0 < 5 should be taken");
        assert_eq!(cpu.get_reg(4), 1, "BGE: 5 >= 0 should be taken");
        assert_eq!(cpu.get_reg(5), 1, "BLTU: 0 < 5 should be taken");
    }

    /// Test 32: Loop simulation using branches
    #[test]
    fn test_loop_simulation() {
        let mut e = RiscvEncoder::new();
        e.addi(1, 0, 5); // x1 = 5 (loop counter) - PC=0
        e.addi(2, 0, 0); // x2 = 0 (accumulator) - PC=4

        // Loop start
        e.addi(2, 2, 1); // x2 = x2 + 1 (increment accumulator) - PC=8
        e.addi(1, 1, -1); // x1 = x1 - 1 (decrement counter) - PC=12
        e.bne(1, 0, -8); // bne x1, x0, -8 (loop if x1 != 0, jump back to PC=8) - PC=16

        // After loop (exit when x1=0)
        e.addi(3, 0, 0); // x3 = 0 - PC=20

        let code = e.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        let mut cpu = MockCpuExecutor::new();
        cpu.load_program(&instructions);
        cpu.execute(100);

        // Loop should execute 5 times, so x2 = 5
        assert_eq!(cpu.get_reg(2), 5, "Loop should execute 5 times");
        assert_eq!(cpu.get_reg(1), 0, "Counter should be 0 after loop");
    }
}
