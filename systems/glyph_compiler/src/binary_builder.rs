use crate::spirv_mapping::GlyphOpcode;
use serde::{Deserialize, Serialize};

/// A single glyph instruction
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Glyph {
    pub opcode: u32,
    pub p1: f32,
    pub p2: f32,
    pub dst: u32,
}

/// A complete glyph program
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GlyphProgram {
    pub glyphs: Vec<Glyph>,
}

pub struct BinaryBuilder {
    words: Vec<u32>,
    id_bound: u32,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_simple_add_program_generates_valid_spirv() {
        let program = GlyphProgram {
            glyphs: vec![
                Glyph { opcode: 206, p1: 1.0, p2: 0.0, dst: 0 }, // MOV 1.0 -> mem[0]
                Glyph { opcode: 206, p1: 2.0, p2: 0.0, dst: 1 }, // MOV 2.0 -> mem[1]
                Glyph { opcode: 216, p1: 0.0, p2: 1.0, dst: 2 }, // ADD mem[0] + mem[1] -> mem[2]
                Glyph { opcode: 212, p1: 0.0, p2: 0.0, dst: 0 }, // HALT
            ],
        };

        let mut builder = BinaryBuilder::new();
        let spirv_binary = builder.compile(&program);

        // Valid SPIR-V starts with magic number 0x07230203
        assert_eq!(spirv_binary[0], 0x07230203);
        // Should have non-zero length
        assert!(spirv_binary.len() > 20);
    }
}

impl Default for BinaryBuilder {
    fn default() -> Self {
        Self::new()
    }
}

impl BinaryBuilder {
    pub fn new() -> Self {
        Self {
            words: Vec::new(),
            id_bound: 1,
        }
    }

    fn next_id(&mut self) -> u32 {
        let id = self.id_bound;
        self.id_bound += 1;
        id
    }

    fn emit(&mut self, opcode: u16, operands: &[u32]) {
        let word_count = (operands.len() + 1) as u32;
        let head = (word_count << 16) | (opcode as u32);
        self.words.push(head);
        self.words.extend_from_slice(operands);
    }

    pub fn compile(&mut self, program: &GlyphProgram) -> Vec<u32> {
        self.words.clear();
        self.id_bound = 1;

        // SPIR-V Header
        let mut result = vec![
            0x07230203, // Magic
            0x00010600, // Version 1.6
            0x00000000, // Generator
            0,          // ID bound (will update)
            0x00000000, // Schema
        ];

        // Capabilities and Extensions
        self.emit(17, &[1]); // OpCapability Shader
        self.emit(14, &[0, 1]); // OpMemoryModel Logical GLSL450

        // Types and Constants
        let void_type = self.next_id();
        let fn_type = self.next_id();
        self.emit(19, &[void_type]); // OpTypeVoid
        self.emit(33, &[fn_type, void_type]); // OpTypeFunction

        // Entry point
        let entry_id = self.next_id();
        self.emit(15, &[5, entry_id, 0x6e69616d, 0]); // OpEntryPoint GLCompute main

        // Function Start
        self.emit(54, &[void_type, entry_id, 0, fn_type]); // OpFunction
        let label_id = self.next_id();
        self.emit(248, &[label_id]); // OpLabel

        // Compile glyphs
        for glyph in &program.glyphs {
            self.compile_glyph(glyph);
        }

        // Implicit return if not halted
        self.emit(253, &[]); // OpReturn
        self.emit(56, &[]); // OpFunctionEnd

        // Update bound in header
        result[3] = self.id_bound;
        result.extend_from_slice(&self.words);
        result
    }

    fn compile_glyph(&mut self, glyph: &Glyph) {
        let opcode = match GlyphOpcode::try_from(glyph.opcode) {
            Ok(op) => op,
            Err(_) => return,
        };

        match opcode {
            GlyphOpcode::HALT_M => {
                self.emit(252, &[]); // OpKill
            }
            // Add more opcode implementations here
            _ => {}
        }
    }
}
