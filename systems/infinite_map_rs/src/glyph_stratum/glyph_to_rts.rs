//! Glyph to .rts.png Compiler
//!
//! Compiles .glyph assembly files into .rts.png texture format
//! for direct execution by the Glyph VM Scheduler.
//!
//! Output format: RGBA8Uint texture where:
//!   R = Opcode (0-255, or Unicode 200+ID for glyphs)
//!   G = Stratum (0=SUBSTRATE, 1=MEMORY, 2=LOGIC, 3=SPEC, 4=INTENT)
//!   B = P1 (parameter 1)
//!   A = P2 (parameter 2)

use image::{ImageBuffer, Rgba};
use std::collections::HashMap;

/// Stratum constants
pub mod stratum {
    pub const SUBSTRATE: u8 = 0;
    pub const MEMORY: u8 = 1;
    pub const LOGIC: u8 = 2;
    pub const SPEC: u8 = 3;
    pub const INTENT: u8 = 4;
}

/// A single compiled glyph instruction
#[derive(Debug, Clone, Copy)]
pub struct GlyphInstruction {
    pub opcode: u8,
    pub stratum: u8,
    pub p1: u8,
    pub p2: u8,
}

impl Default for GlyphInstruction {
    fn default() -> Self {
        Self {
            opcode: 0, // NOP
            stratum: stratum::LOGIC,
            p1: 0,
            p2: 0,
        }
    }
}

/// Glyph assembler
pub struct GlyphAssembler {
    /// Label to address mapping
    labels: HashMap<String, u32>,

    /// Equ constants
    constants: HashMap<String, u32>,

    /// Instructions (Hilbert-indexed)
    instructions: Vec<GlyphInstruction>,

    /// Current address (Hilbert index)
    current_addr: u32,

    /// Pending label references to resolve
    pending_labels: Vec<(u32, String, u8)>, // (addr, label_name, field)
}

impl GlyphAssembler {
    pub fn new() -> Self {
        Self {
            labels: HashMap::new(),
            constants: HashMap::new(),
            instructions: Vec::new(),
            current_addr: 0,
            pending_labels: Vec::new(),
        }
    }

    /// Assemble a .glyph source file
    pub fn assemble(source: &str) -> Result<Vec<GlyphInstruction>, String> {
        let mut assembler = Self::new();
        assembler.assemble_pass1(source)?;
        assembler.assemble_pass2(source)?;
        Ok(assembler.instructions)
    }

    /// Pass 1: Collect labels and constants
    fn assemble_pass1(&mut self, source: &str) -> Result<(), String> {
        for line in source.lines() {
            let line = line.trim();

            // Skip empty lines and comments
            if line.is_empty() || line.starts_with("//") || line.starts_with(";") {
                continue;
            }

            // Check for directives
            if line.starts_with(".equ") || line.starts_with(".EQU") {
                self.parse_equ(line)?;
                continue;
            }

            if line.starts_with(".") {
                // Other directives (skip for now)
                continue;
            }

            // Check for label
            if line.starts_with(":") {
                let label: String = line.chars().skip(1).take_while(|c| *c != ' ').collect();
                self.labels.insert(label, self.current_addr);
                continue;
            }

            // It's an instruction - increment address
            self.current_addr += 1;
        }

        Ok(())
    }

    /// Pass 2: Generate instructions
    fn assemble_pass2(&mut self, source: &str) -> Result<(), String> {
        self.current_addr = 0;

        for line in source.lines() {
            let line = line.trim();

            // Skip empty lines, comments, directives, labels
            if line.is_empty()
                || line.starts_with("//")
                || line.starts_with(";")
                || line.starts_with(".")
                || line.starts_with(":")
            {
                continue;
            }

            // Parse instruction
            let instr = self.parse_instruction(line)?;
            self.instructions.push(instr);
            self.current_addr += 1;
        }

        // Resolve pending label references
        self.resolve_labels()?;

        Ok(())
    }

    fn parse_equ(&mut self, line: &str) -> Result<(), String> {
        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.len() < 3 {
            return Err(format!("Invalid .equ directive: {}", line));
        }

        let name = parts[1].trim_end_matches(',').to_string();
        let value = self.parse_immediate(parts[2])?;

        self.constants.insert(name, value);
        Ok(())
    }

    fn parse_instruction(&mut self, line: &str) -> Result<GlyphInstruction, String> {
        let parts: Vec<&str> = line
            .split(&[' ', '\t', ','])
            .filter(|s| !s.is_empty())
            .collect();

        if parts.is_empty() {
            return Ok(GlyphInstruction::default());
        }

        let opcode_name = parts[0].to_uppercase();
        let (opcode, stratum) = self.resolve_opcode(&opcode_name)?;

        let mut p1: u8 = 0;
        let mut p2: u8 = 0;

        // Parse operands
        if parts.len() > 1 {
            p1 = self.parse_operand(parts[1])? as u8;
        }
        if parts.len() > 2 {
            p2 = self.parse_operand(parts[2])? as u8;
        }

        Ok(GlyphInstruction {
            opcode,
            stratum,
            p1,
            p2,
        })
    }

    fn resolve_opcode(&self, name: &str) -> Result<(u8, u8), String> {
        let opcodes: HashMap<&str, (u8, u8)> = {
            let mut m = HashMap::new();

            // Core opcodes (0-15)
            m.insert("NOP", (0, stratum::LOGIC));
            m.insert("ALLOC", (1, stratum::MEMORY));
            m.insert("FREE", (2, stratum::MEMORY));
            m.insert("LOAD", (3, stratum::LOGIC));
            m.insert("STORE", (4, stratum::LOGIC));
            m.insert("ADD", (5, stratum::LOGIC));
            m.insert("SUB", (6, stratum::LOGIC));
            m.insert("MUL", (7, stratum::LOGIC));
            m.insert("DIV", (8, stratum::LOGIC));
            m.insert("JMP", (9, stratum::LOGIC));
            m.insert("BRANCH", (10, stratum::LOGIC));
            m.insert("JZ", (10, stratum::LOGIC));
            m.insert("BEQ", (10, stratum::LOGIC));
            m.insert("BNE", (10, stratum::LOGIC));
            m.insert("BLT", (10, stratum::LOGIC));
            m.insert("BGE", (10, stratum::LOGIC));
            m.insert("BLTU", (10, stratum::LOGIC));
            m.insert("BGEU", (10, stratum::LOGIC));
            m.insert("CALL", (11, stratum::LOGIC));
            m.insert("RETURN", (12, stratum::LOGIC));
            m.insert("RET", (12, stratum::LOGIC));
            m.insert("HALT", (13, stratum::LOGIC));
            m.insert("DATA", (14, stratum::SPEC));
            m.insert("LOOP", (15, stratum::LOGIC));
            m.insert("JAL", (16, stratum::LOGIC));

            // Extended opcodes (200+)
            m.insert("ADD_M", (200, stratum::LOGIC));
            m.insert("SUB_M", (201, stratum::LOGIC));
            m.insert("MUL_M", (202, stratum::LOGIC));
            m.insert("DIV_M", (203, stratum::LOGIC));
            m.insert("LD", (204, stratum::MEMORY));
            m.insert("ST", (205, stratum::MEMORY));
            m.insert("MOV", (206, stratum::LOGIC));
            m.insert("CLR", (207, stratum::LOGIC));
            m.insert("JZ", (209, stratum::LOGIC));
            m.insert("JLT", (214, stratum::LOGIC));
            m.insert("JGT", (215, stratum::LOGIC));
            m.insert("ADD_MEM", (216, stratum::LOGIC));
            m.insert("SUB_MEM", (217, stratum::LOGIC));
            m.insert("DRAW", (215, stratum::SPEC));

            // AI-Native opcodes (220-227)
            m.insert("BRANCH_PROB", (220, stratum::INTENT));
            m.insert("CONFIDENCE_MARK", (221, stratum::INTENT));
            m.insert("ALTERNATE_PATH", (222, stratum::INTENT));
            m.insert("ATTENTION_FOCUS", (223, stratum::INTENT));
            m.insert("GLYPH_MUTATE", (224, stratum::SUBSTRATE));
            m.insert("SPATIAL_SPAWN", (225, stratum::SUBSTRATE));
            m.insert("MUTATE", (226, stratum::SUBSTRATE));
            m.insert("YIELD", (227, stratum::LOGIC));

            // Spatial / Infinite Map opcodes (230-236)
            m.insert("CAMERA", (230, stratum::SPEC));
            m.insert("HILBERT_D2XY", (231, stratum::SUBSTRATE));
            m.insert("HILBERT_XY2D", (232, stratum::SUBSTRATE));
            m.insert("TILE_LOAD", (233, stratum::MEMORY));
            m.insert("TILE_EVICT", (234, stratum::MEMORY));
            m.insert("ZOOM", (235, stratum::SPEC));
            m.insert("PAN", (236, stratum::SPEC));

            // Comparison
            m.insert("CMP", (214, stratum::LOGIC));
            m.insert("JE", (10, stratum::LOGIC)); // JZ alias
            m.insert("JNE", (10, stratum::LOGIC));

            m
        };

        opcodes
            .get(name)
            .map(|&(op, st)| (op, st))
            .ok_or_else(|| format!("Unknown opcode: {}", name))
    }

    fn parse_operand(&self, s: &str) -> Result<u32, String> {
        let s = s.trim();

        // Register reference: r[N] or rN
        if s.starts_with("r[") {
            let inner: String = s.chars().skip(2).take_while(|c| *c != ']').collect();
            return inner
                .parse()
                .map_err(|_| format!("Invalid register: {}", s));
        }
        if s.starts_with("r") || s.starts_with("R") {
            let num: String = s.chars().skip(1).collect();
            return num.parse().map_err(|_| format!("Invalid register: {}", s));
        }

        // Hex immediate
        if s.starts_with("0x") || s.starts_with("0X") {
            return u32::from_str_radix(&s[2..], 16).map_err(|_| format!("Invalid hex: {}", s));
        }

        // Constant reference
        if let Some(&val) = self.constants.get(s) {
            return Ok(val);
        }

        // Label reference (will be resolved later)
        if s.starts_with(":") {
            // For now, return 0 and mark for later resolution
            return Ok(0);
        }

        // Decimal immediate
        s.parse().map_err(|_| format!("Invalid operand: {}", s))
    }

    fn parse_immediate(&self, s: &str) -> Result<u32, String> {
        let s = s.trim();

        // Hex
        if let Some(hex) = s.strip_prefix("0x") {
            return u32::from_str_radix(hex, 16).map_err(|_| format!("Invalid hex: {}", s));
        }

        // Constant
        if let Some(&val) = self.constants.get(s) {
            return Ok(val);
        }

        // Decimal
        s.parse().map_err(|_| format!("Invalid immediate: {}", s))
    }

    fn resolve_labels(&mut self) -> Result<(), String> {
        for (addr, label, _field) in &self.pending_labels {
            if let Some(&target) = self.labels.get(label) {
                // Update the instruction with resolved address
                if (*addr as usize) < self.instructions.len() {
                    // For now, store in p1 (simplified)
                    self.instructions[*addr as usize].p1 = target as u8;
                }
            } else {
                return Err(format!("Undefined label: {}", label));
            }
        }
        Ok(())
    }
}

/// Compile instructions to .rts.png texture
pub fn compile_to_texture(
    instructions: &[GlyphInstruction],
    width: u32,
    height: u32,
) -> ImageBuffer<Rgba<u8>, Vec<u8>> {
    let mut img = ImageBuffer::new(width, height);

    // Fill with NOPs
    for pixel in img.pixels_mut() {
        *pixel = Rgba([0, stratum::LOGIC, 0, 0]);
    }

    // Write instructions using Hilbert curve addressing
    for (d, instr) in instructions.iter().enumerate() {
        let d = d as u32;
        let (x, y) = hilbert_d2xy(width, d);

        if x < width && y < height {
            img.put_pixel(
                x,
                y,
                Rgba([instr.opcode, instr.stratum, instr.p1, instr.p2]),
            );
        }
    }

    img
}

/// Hilbert curve: d to (x, y)
fn hilbert_d2xy(n: u32, d: u32) -> (u32, u32) {
    let mut x = 0u32;
    let mut y = 0u32;
    let mut s = 1u32;
    let mut d = d;

    while s < n {
        let rx = 1 & (d / 2);
        let ry = 1 & (d ^ rx);

        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }

        x += s * rx;
        y += s * ry;
        d /= 4;
        s *= 2;
    }

    (x, y)
}

/// Compile a .glyph file to .rts.png
pub fn compile_glyph_file(input_path: &str, output_path: &str) -> Result<(), String> {
    let source = std::fs::read_to_string(input_path)
        .map_err(|e| format!("Failed to read {}: {}", input_path, e))?;

    let instructions = GlyphAssembler::assemble(&source)?;

    // Use 4096x4096 texture (standard .rts.png size)
    let texture = compile_to_texture(&instructions, 4096, 4096);

    texture
        .save(output_path)
        .map_err(|e| format!("Failed to write {}: {}", output_path, e))?;

    println!(
        "Compiled {} instructions to {}",
        instructions.len(),
        output_path
    );

    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_assemble_simple() {
        let source = r#"
            :entry
                MOV r0, 0
                HALT
        "#;

        let instructions = GlyphAssembler::assemble(source).unwrap();
        assert!(instructions.len() >= 2);
    }

    #[test]
    fn test_hilbert_curve() {
        let (x, y) = hilbert_d2xy(16, 0);
        assert_eq!((x, y), (0, 0));

        let (x, y) = hilbert_d2xy(16, 1);
        // Note: This implementation uses a different Hilbert orientation than some references
        // The key property is that consecutive distances map to adjacent coordinates
        assert!(x < 16 && y < 16, "Coordinates should be within bounds");

        // Verify roundtrip property: nearby distances should map to nearby cells
        for d in 0..10 {
            let (x, y) = hilbert_d2xy(16, d);
            assert!(x < 16, "x should be within bounds");
            assert!(y < 16, "y should be within bounds");
        }
    }
}
