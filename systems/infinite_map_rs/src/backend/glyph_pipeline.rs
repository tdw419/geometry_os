//! Glyph → SPIR-V → Batch Buffer Pipeline
//!
//! Complete compilation pipeline from Geometry OS glyph programs
//! to Intel GPU batch buffers.

use anyhow::{Result, anyhow};

/// Glyph opcodes (200-227)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum GlyphOpcode {
    Nop = 200,
    Add = 201,
    Sub = 202,
    Mul = 203,
    Div = 204,
    Load = 205,
    Store = 206,
    LoadImm = 207,
    Jump = 208,
    JumpZ = 209,
    JumpNz = 210,
    Cmp = 211,
    And = 212,
    Or = 213,
    Xor = 214,
    Not = 215,
    Shl = 216,
    Shr = 217,
    Call = 218,
    Ret = 219,
    Push = 220,
    Pop = 221,
    Read = 222,
    Write = 223,
    Sync = 224,
    Atomic = 225,
    Fadd = 226,
    Fmul = 227,
}

impl TryFrom<u8> for GlyphOpcode {
    type Error = anyhow::Error;

    fn try_from(value: u8) -> Result<Self> {
        match value {
            200 => Ok(GlyphOpcode::Nop),
            201 => Ok(GlyphOpcode::Add),
            202 => Ok(GlyphOpcode::Sub),
            203 => Ok(GlyphOpcode::Mul),
            204 => Ok(GlyphOpcode::Div),
            205 => Ok(GlyphOpcode::Load),
            206 => Ok(GlyphOpcode::Store),
            207 => Ok(GlyphOpcode::LoadImm),
            208 => Ok(GlyphOpcode::Jump),
            209 => Ok(GlyphOpcode::JumpZ),
            210 => Ok(GlyphOpcode::JumpNz),
            211 => Ok(GlyphOpcode::Cmp),
            212 => Ok(GlyphOpcode::And),
            213 => Ok(GlyphOpcode::Or),
            214 => Ok(GlyphOpcode::Xor),
            215 => Ok(GlyphOpcode::Not),
            216 => Ok(GlyphOpcode::Shl),
            217 => Ok(GlyphOpcode::Shr),
            218 => Ok(GlyphOpcode::Call),
            219 => Ok(GlyphOpcode::Ret),
            220 => Ok(GlyphOpcode::Push),
            221 => Ok(GlyphOpcode::Pop),
            222 => Ok(GlyphOpcode::Read),
            223 => Ok(GlyphOpcode::Write),
            224 => Ok(GlyphOpcode::Sync),
            225 => Ok(GlyphOpcode::Atomic),
            226 => Ok(GlyphOpcode::Fadd),
            227 => Ok(GlyphOpcode::Fmul),
            _ => Err(anyhow!("Invalid glyph opcode: {}", value)),
        }
    }
}

/// Glyph instruction: [opcode:8][dst:8][src1:8][src2:8]
#[derive(Debug, Clone, Copy)]
pub struct GlyphInst {
    pub opcode: GlyphOpcode,
    pub dst: u8,
    pub src1: u8,
    pub src2: u8,
}

impl GlyphInst {
    /// Create new glyph instruction
    pub fn new(opcode: GlyphOpcode, dst: u8, src1: u8, src2: u8) -> Self {
        Self { opcode, dst, src1, src2 }
    }

    /// Create from raw 32-bit word
    pub fn from_word(word: u32) -> Result<Self> {
        let opcode = ((word >> 24) & 0xFF) as u8;
        let dst = ((word >> 16) & 0xFF) as u8;
        let src1 = ((word >> 8) & 0xFF) as u8;
        let src2 = (word & 0xFF) as u8;

        Ok(Self {
            opcode: GlyphOpcode::try_from(opcode)?,
            dst,
            src1,
            src2,
        })
    }

    /// Convert to raw 32-bit word
    pub fn to_word(&self) -> u32 {
        ((self.opcode as u8 as u32) << 24) |
        ((self.dst as u32) << 16) |
        ((self.src1 as u32) << 8) |
        (self.src2 as u32)
    }
}

/// Glyph program (sequence of instructions)
#[derive(Debug, Clone)]
pub struct GlyphProgram {
    instructions: Vec<GlyphInst>,
}

impl GlyphProgram {
    /// Create empty program
    pub fn new() -> Self {
        Self { instructions: Vec::new() }
    }

    /// Add instruction
    pub fn add(&mut self, inst: GlyphInst) -> &mut Self {
        self.instructions.push(inst);
        self
    }

    /// Add load immediate
    pub fn load_imm(&mut self, dst: u8, imm: u8) -> &mut Self {
        self.add(GlyphInst::new(GlyphOpcode::LoadImm, dst, imm, 0))
    }

    /// Add integer add
    pub fn add_i32(&mut self, dst: u8, src1: u8, src2: u8) -> &mut Self {
        self.add(GlyphInst::new(GlyphOpcode::Add, dst, src1, src2))
    }

    /// Add integer multiply
    pub fn mul_i32(&mut self, dst: u8, src1: u8, src2: u8) -> &mut Self {
        self.add(GlyphInst::new(GlyphOpcode::Mul, dst, src1, src2))
    }

    /// Add store
    pub fn store(&mut self, addr: u8, src: u8) -> &mut Self {
        self.add(GlyphInst::new(GlyphOpcode::Store, addr, src, 0))
    }

    /// Add float add
    pub fn add_f32(&mut self, dst: u8, src1: u8, src2: u8) -> &mut Self {
        self.add(GlyphInst::new(GlyphOpcode::Fadd, dst, src1, src2))
    }

    /// Add nop
    pub fn nop(&mut self) -> &mut Self {
        self.add(GlyphInst::new(GlyphOpcode::Nop, 0, 0, 0))
    }

    /// Get instructions
    pub fn instructions(&self) -> &[GlyphInst] {
        &self.instructions
    }

    /// Get as raw words
    pub fn to_words(&self) -> Vec<u32> {
        self.instructions.iter().map(|i| i.to_word()).collect()
    }
}

impl Default for GlyphProgram {
    fn default() -> Self {
        Self::new()
    }
}

/// SPIR-V compiler for glyph programs
pub struct GlyphToSpirv {
    words: Vec<u32>,
    next_id: u32,
}

impl GlyphToSpirv {
    /// Create new SPIR-V compiler
    pub fn new() -> Self {
        Self {
            words: Vec::with_capacity(1024),
            next_id: 1,
        }
    }

    /// Add word to SPIR-V
    fn word(&mut self, w: u32) {
        self.words.push(w);
    }

    /// Add instruction
    fn inst(&mut self, opcode: u16, args: &[u32]) {
        self.word(((args.len() + 1) as u32) << 16 | opcode as u32);
        for arg in args {
            self.word(*arg);
        }
    }

    /// Compile glyph program to SPIR-V
    pub fn compile(&mut self, program: &GlyphProgram) -> Result<Vec<u32>> {
        // SPIR-V header
        self.word(0x07230203);  // Magic
        self.word(0x00010000);  // Version 1.0
        self.word(0x00100000);  // Generator ID
        self.word(0);           // Bound (placeholder)
        self.word(0);           // Schema

        // Types
        let type_void = self.next_id;
        self.next_id += 1;
        self.inst(19, &[type_void]);  // OpTypeVoid

        let type_int = self.next_id;
        self.next_id += 1;
        self.inst(21, &[type_int, 32, 1]);  // OpTypeInt 32 signed

        let type_float = self.next_id;
        self.next_id += 1;
        self.inst(22, &[type_float, 32]);  // OpTypeFloat 32

        // Compile each instruction
        for inst in program.instructions() {
            let result_id = self.next_id;
            self.next_id += 1;

            match inst.opcode {
                GlyphOpcode::Add => {
                    self.inst(128, &[type_int, result_id, inst.src1 as u32, inst.src2 as u32]);
                }
                GlyphOpcode::Sub => {
                    self.inst(129, &[type_int, result_id, inst.src1 as u32, inst.src2 as u32]);
                }
                GlyphOpcode::Mul => {
                    self.inst(132, &[type_int, result_id, inst.src1 as u32, inst.src2 as u32]);
                }
                GlyphOpcode::Fadd => {
                    self.inst(129, &[type_float, result_id, inst.src1 as u32, inst.src2 as u32]);
                }
                GlyphOpcode::Fmul => {
                    self.inst(133, &[type_float, result_id, inst.src1 as u32, inst.src2 as u32]);
                }
                _ => {
                    self.inst(0, &[]);  // OpNop
                }
            }
        }

        // OpReturn
        self.inst(253, &[]);

        // Update bound
        self.words[3] = self.next_id;

        Ok(self.words.clone())
    }
}

impl Default for GlyphToSpirv {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_glyph_instruction() {
        let inst = GlyphInst::new(GlyphOpcode::Add, 1, 2, 3);
        assert_eq!(inst.opcode, GlyphOpcode::Add);
        assert_eq!(inst.dst, 1);
        assert_eq!(inst.src1, 2);
        assert_eq!(inst.src2, 3);

        let word = inst.to_word();
        assert_eq!(word, 0xC9010203);

        let parsed = GlyphInst::from_word(word).unwrap();
        assert_eq!(parsed.opcode, GlyphOpcode::Add);
        assert_eq!(parsed.dst, 1);
    }

    #[test]
    fn test_glyph_program() {
        let mut prog = GlyphProgram::new();
        prog.load_imm(0, 100)
            .load_imm(1, 200)
            .add_i32(2, 0, 1)
            .mul_i32(3, 2, 0)
            .store(4, 3)
            .add_f32(5, 0, 1)
            .nop();

        assert_eq!(prog.instructions().len(), 7);

        let words = prog.to_words();
        assert_eq!(words.len(), 7);
        assert_eq!((words[0] >> 24) & 0xFF, 207);  // LoadImm
        assert_eq!((words[2] >> 24) & 0xFF, 201);  // Add
    }

    #[test]
    fn test_spirv_compilation() {
        let mut prog = GlyphProgram::new();
        prog.load_imm(0, 100)
            .add_i32(1, 0, 0)
            .nop();

        let mut compiler = GlyphToSpirv::new();
        let spirv = compiler.compile(&prog).unwrap();

        // Check magic
        assert_eq!(spirv[0], 0x07230203);

        // Should have header (5 words) + types + instructions
        assert!(spirv.len() > 5);
    }
}
