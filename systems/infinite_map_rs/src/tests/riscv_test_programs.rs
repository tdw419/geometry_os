// RISC-V Test Programs for Phase 1 Validation
//
// These test programs validate the multi-workgroup execution implementation:
// 1. Correctness: Results match v1.0 sequential execution
// 2. Performance: Parallel workloads show speedup
// 3. Synchronization: No race conditions in PC coordination

use std::vec::Vec;

/// RISC-V instruction encoder helper
pub struct RiscvEncoder {
    code: Vec<u32>,
    pc: u32,
}

impl RiscvEncoder {
    pub fn new() -> Self {
        Self {
            code: Vec::new(),
            pc: 0,
        }
    }

    /// Emit R-type instruction
    fn emit_r(&mut self, opcode: u32, rd: u32, rs1: u32, rs2: u32, funct3: u32, funct7: u32) {
        let inst = (funct7 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode;
        self.code.push(inst);
        self.pc += 4;
    }

    /// Emit I-type instruction
    fn emit_i(&mut self, opcode: u32, rd: u32, rs1: u32, funct3: u32, imm: u32) {
        let inst = ((imm & 0xFFF) << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode;
        self.code.push(inst);
        self.pc += 4;
    }

    /// Emit U-type instruction
    fn emit_u(&mut self, opcode: u32, rd: u32, imm: u32) {
        let inst = (imm & 0xFFFFF000) | (rd << 7) | opcode;
        self.code.push(inst);
        self.pc += 4;
    }

    /// NOP instruction
    pub fn nop(&mut self) {
        self.addi(0, 0, 0); // addi x0, x0, 0
    }

    /// ADD rd, rs1, rs2
    pub fn add(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x0, 0x00);
    }

    /// ADDI rd, rs1, imm
    pub fn addi(&mut self, rd: u32, rs1: u32, imm: i32) {
        self.emit_i(0x13, rd, rs1, 0x0, imm as u32);
    }

    /// ADDI rd, rs1, imm (unsigned version)
    pub fn addiu(&mut self, rd: u32, rs1: u32, imm: u32) {
        self.emit_i(0x13, rd, rs1, 0x0, imm);
    }

    /// LUI rd, imm
    pub fn lui(&mut self, rd: u32, imm: u32) {
        self.emit_u(0x37, rd, imm);
    }

    /// SUB rd, rs1, rs2
    pub fn sub(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x0, 0x20);
    }

    /// XOR rd, rs1, rs2
    fn xor(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x4, 0x00);
    }

    /// AND rd, rs1, rs2
    fn and(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x7, 0x00);
    }

    /// OR rd, rs1, rs2
    fn or(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x6, 0x00);
    }

    /// SLL rd, rs1, rs2
    fn sll(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x1, 0x00);
    }

    /// SRL rd, rs1, rs2
    fn srl(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x5, 0x00);
    }

    /// SLT rd, rs1, rs2
    fn slt(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x2, 0x00);
    }

    /// SLTU rd, rs1, rs2
    fn sltu(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x3, 0x00);
    }

    // ========================================
    // RV32M Extension (Multiply/Divide)
    // ========================================

    /// MUL rd, rs1, rs2 - Multiply (lower 32 bits)
    pub fn mul(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x0, 0x01);
    }

    /// MULH rd, rs1, rs2 - Multiply High (signed * signed, upper 32 bits)
    pub fn mulh(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x1, 0x01);
    }

    /// MULHSU rd, rs1, rs2 - Multiply High (signed * unsigned, upper 32 bits)
    pub fn mulhsu(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x2, 0x01);
    }

    /// MULHU rd, rs1, rs2 - Multiply High (unsigned * unsigned, upper 32 bits)
    pub fn mulhu(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x3, 0x01);
    }

    /// DIV rd, rs1, rs2 - Divide (signed)
    pub fn div(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x4, 0x01);
    }

    /// DIVU rd, rs1, rs2 - Divide (unsigned)
    pub fn divu(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x5, 0x01);
    }

    /// REM rd, rs1, rs2 - Remainder (signed)
    pub fn rem(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x6, 0x01);
    }

    /// REMU rd, rs1, rs2 - Remainder (unsigned)
    pub fn remu(&mut self, rd: u32, rs1: u32, rs2: u32) {
        self.emit_r(0x33, rd, rs1, rs2, 0x7, 0x01);
    }

    /// ECALL (environment call for syscall)
    pub fn ecall(&mut self) {
        self.emit_i(0x73, 0, 0, 0x0, 0x000);
    }

    /// EBREAK (breakpoint)
    pub fn ebreak(&mut self) {
        self.emit_i(0x73, 0, 0, 0x0, 0x001);
    }

    /// Emit B-type instruction (branch)
    fn emit_b(&mut self, opcode: u32, rs1: u32, rs2: u32, funct3: u32, imm: i16) {
        // B-type: imm[12|10:5] rs2 rs1 funct3 imm[4:1|11] opcode
        // Sign-extend the immediate to 13 bits (imm[12:0])
        let imm_u32 = imm as u32;

        let imm_lo = ((imm_u32 >> 1) & 0xF) as u32; // imm[4:1]
        let imm_hi = ((imm_u32 >> 5) & 0x3F) as u32; // imm[10:5]
        let imm_11 = ((imm_u32 >> 11) & 0x1) as u32; // imm[11]
        let imm_12 = ((imm_u32 >> 12) & 0x1) as u32; // imm[12]

        let inst = (imm_12 << 31)
            | (imm_11 << 7)
            | (imm_hi << 25)
            | (rs2 << 20)
            | (rs1 << 15)
            | (funct3 << 12)
            | (imm_lo << 8)
            | opcode;
        self.code.push(inst);
        self.pc += 4;
    }

    /// Emit J-type instruction (jump)
    fn emit_j(&mut self, opcode: u32, rd: u32, imm: i32) {
        // J-type: imm[20|10:1|11|19:12] rd opcode
        // Sign-extend the immediate to 21 bits (imm[20:0])
        let imm_u32 = imm as u32;

        let imm_lo = ((imm_u32 >> 1) & 0x3FF) as u32; // imm[10:1]
        let imm_11 = ((imm_u32 >> 11) & 0x1) as u32; // imm[11]
        let imm_hi = ((imm_u32 >> 12) & 0xFF) as u32; // imm[19:12]
        let imm_20 = ((imm_u32 >> 20) & 0x1) as u32; // imm[20]

        let inst =
            (imm_20 << 31) | (imm_hi << 12) | (imm_11 << 20) | (imm_lo << 21) | (rd << 7) | opcode;
        self.code.push(inst);
        self.pc += 4;
    }

    /// BEQ rs1, rs2, offset
    pub fn beq(&mut self, rs1: u32, rs2: u32, offset: i16) {
        self.emit_b(0x63, rs1, rs2, 0x0, offset);
    }

    /// BNE rs1, rs2, offset
    pub fn bne(&mut self, rs1: u32, rs2: u32, offset: i16) {
        self.emit_b(0x63, rs1, rs2, 0x1, offset);
    }

    /// BLT rs1, rs2, offset (signed less than)
    pub fn blt(&mut self, rs1: u32, rs2: u32, offset: i16) {
        self.emit_b(0x63, rs1, rs2, 0x4, offset);
    }

    /// BGE rs1, rs2, offset (signed greater or equal)
    pub fn bge(&mut self, rs1: u32, rs2: u32, offset: i16) {
        self.emit_b(0x63, rs1, rs2, 0x5, offset);
    }

    /// BLTU rs1, rs2, offset (unsigned less than)
    pub fn bltu(&mut self, rs1: u32, rs2: u32, offset: i16) {
        self.emit_b(0x63, rs1, rs2, 0x6, offset);
    }

    /// BGEU rs1, rs2, offset (unsigned greater or equal)
    pub fn bgeu(&mut self, rs1: u32, rs2: u32, offset: i16) {
        self.emit_b(0x63, rs1, rs2, 0x7, offset);
    }

    /// JAL rd, offset
    pub fn jal(&mut self, rd: u32, offset: i32) {
        self.emit_j(0x6F, rd, offset);
    }

    /// JALR rd, rs1, offset
    pub fn jalr(&mut self, rd: u32, rs1: u32, offset: i16) {
        self.emit_i(0x67, rd, rs1, 0x0, offset as u32);
    }

    pub fn finalize(self) -> Vec<u8> {
        self.code
            .into_iter()
            .flat_map(|word| word.to_le_bytes().to_vec())
            .collect()
    }
}

// ============================================================================
// TEST PROGRAM 1: Independent Additions (Embarrassingly Parallel)
// ============================================================================

/// Test program with independent ADD operations
/// Expected: Linear speedup with workgroup size
pub fn test_independent_adds() -> Vec<u8> {
    let mut e = RiscvEncoder::new();

    // Initialize: Set x1 = 1, x2 = 2, ..., x10 = 10
    for i in 1i32..=10 {
        e.addi(i as u32, 0, i);
    }

    // Perform 100 independent additions
    // Each: x11 = x1 + x2, x12 = x3 + x4, etc.
    for _ in 0..100 {
        e.add(11, 1, 2); // x11 = x1 + x2
        e.add(12, 3, 4); // x12 = x3 + x4
        e.add(13, 5, 6); // x13 = x5 + x6
        e.add(14, 7, 8); // x14 = x7 + x8
        e.add(15, 9, 10); // x15 = x9 + x10
    }

    e.ecall(); // Syscall to signal completion
    e.finalize()
}

// ============================================================================
// TEST PROGRAM 2: Sequential Chain (Anti-Pattern)
// ============================================================================

/// Test program with data dependencies (sequential chain)
/// Expected: Limited speedup due to dependencies
pub fn test_sequential_chain() -> Vec<u8> {
    let mut e = RiscvEncoder::new();

    // Initialize: x1 = 1
    e.addi(1, 0, 1);

    // Chain: x2 = x1 + 1, x3 = x2 + 1, ..., x10 = x9 + 1
    // Each instruction depends on the previous
    for i in 2..=10 {
        e.addi(i, i - 1, 1);
    }

    // Repeat the chain 100 times
    for _ in 0..100 {
        for i in 2..=10 {
            e.addi(i, i - 1, 1);
        }
    }

    e.ecall();
    e.finalize()
}

// ============================================================================
// TEST PROGRAM 3: Memory Access Pattern
// ============================================================================

/// Test program with sequential memory access
/// Expected: Moderate speedup
pub fn test_memory_access() -> Vec<u8> {
    let mut e = RiscvEncoder::new();

    // Load immediate: x1 = 0x1000 (base address)
    e.lui(1, 0x1000 >> 12);

    // Simulate memory operations by doing arithmetic
    // In a real test, this would use LW/SW instructions
    for i in 0..100 {
        e.addi(2, 1, i * 4); // Calculate address
        e.addi(3, 2, 0); // Simulate load
        e.addi(4, 3, 1); // Simulate operation
    }

    e.ecall();
    e.finalize()
}

// ============================================================================
// TEST PROGRAM 4: Mixed Workload
// ============================================================================

/// Test program with mix of parallel and sequential sections
/// Expected: Moderate speedup overall
pub fn test_mixed_workload() -> Vec<u8> {
    let mut e = RiscvEncoder::new();

    // Section 1: Independent operations (parallelizable)
    for i in 1i32..=10 {
        e.addi(i as u32, 0, i);
    }

    // Section 2: Sequential chain (not parallelizable)
    for i in 11..=15 {
        e.addi(i, i - 1, 1);
    }

    // Section 3: Independent operations again
    for _ in 0..50 {
        e.add(16, 1, 2);
        e.add(17, 3, 4);
        e.add(18, 5, 6);
    }

    e.ecall();
    e.finalize()
}

// ============================================================================
// TEST PROGRAM 5: Arithmetic Intensive (CPU Bound)
// ============================================================================

/// Test program with heavy arithmetic operations
/// Expected: Good speedup (ALU operations are independent)
pub fn test_arithmetic_intensive() -> Vec<u8> {
    let mut e = RiscvEncoder::new();

    // Initialize values
    for i in 1i32..=8 {
        e.addi(i as u32, 0, i);
    }

    // Perform many arithmetic operations
    for _ in 0..200 {
        e.add(10, 1, 2); // ADD
        e.sub(11, 3, 4); // SUB
        e.xor(12, 5, 6); // XOR
        e.and(13, 7, 8); // AND
        e.or(14, 1, 3); // OR
        e.sll(15, 2, 4); // SLL
        e.srl(16, 5, 7); // SRL
        e.slt(17, 6, 8); // SLT
        e.sltu(18, 1, 2); // SLTU
    }

    e.ecall();
    e.finalize()
}

// ============================================================================
// TEST PROGRAM 6: Control Flow (Branches)
// ============================================================================

/// Test program with conditional branches
/// Expected: Limited speedup (branch dependencies)
pub fn test_control_flow() -> Vec<u8> {
    let mut e = RiscvEncoder::new();

    // Initialize
    e.addi(1, 0, 100); // Loop counter

    // Simple loop (will be executed unrolled in benchmark)
    for _ in 0..50 {
        e.addi(2, 2, 1); // Accumulator
        e.addi(1, 1, -1); // Decrement counter (-1)
    }

    e.ecall();
    e.finalize()
}

// ============================================================================
// TEST UTILITIES
// ============================================================================

/// Expected result for a test program
#[derive(Debug, Clone)]
pub struct ExpectedResult {
    /// Register values after execution
    pub registers: [u32; 32],
    /// Final PC value
    pub pc: u32,
    /// Instruction count
    pub instruction_count: u32,
}

/// Calculate expected result for independent_adds test
pub fn expected_independent_adds() -> ExpectedResult {
    let mut regs = [0u32; 32];

    // After initialization
    for i in 1..=10u32 {
        regs[i as usize] = i;
    }

    // After 100 iterations of additions
    // x11 = x1 + x2 = 1 + 2 = 3 (repeated 100 times, but value stays 3)
    regs[11] = 1 + 2;
    regs[12] = 3 + 4;
    regs[13] = 5 + 6;
    regs[14] = 7 + 8;
    regs[15] = 9 + 10;

    ExpectedResult {
        registers: regs,
        pc: (10 + 100 * 5 + 1) * 4, // 10 init + 500 ops + 1 ecall
        instruction_count: 10 + 100 * 5 + 1,
    }
}

/// Verify test result matches expected
pub fn verify_result(actual: &[u32], expected: &ExpectedResult) -> bool {
    if actual.len() != 32 {
        return false;
    }

    for i in 0..32 {
        // Skip x0 (always zero) and unchecked registers
        if i == 0 || expected.registers[i] == 0 {
            continue;
        }

        // Allow x10 (a0/syscall result) to vary
        if i == 10 {
            continue;
        }

        if actual[i] != expected.registers[i] {
            return false;
        }
    }

    true
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_encoder_basic() {
        let mut e = RiscvEncoder::new();
        e.nop();
        e.addi(1, 0, 42);
        e.ecall();

        let code = e.finalize();
        assert_eq!(code.len(), 12); // 3 instructions * 4 bytes
    }

    #[test]
    fn test_independent_adds_length() {
        let code = test_independent_adds();
        // 10 init + 100*5 ops + 1 ecall = 511 instructions
        assert_eq!(code.len(), 511 * 4);
    }

    #[test]
    fn test_expected_result() {
        let expected = expected_independent_adds();
        assert_eq!(expected.registers[11], 3);
        assert_eq!(expected.registers[12], 7);
        assert_eq!(expected.registers[13], 11);
    }
}
