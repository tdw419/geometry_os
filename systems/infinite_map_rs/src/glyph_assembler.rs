//! Glyph Assembler
//!
//! Compiles text assembly to GPU opcodes that can run on the Glyph VM.
//! This is the key to self-hosting: programs writing programs.

use std::collections::HashMap;

/// Opcodes for the Glyph VM
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Opcode {
    Nop = 0,
    Ldi = 1,
    Mov = 2,
    Load = 3,
    Store = 4,
    Add = 5,
    Sub = 6,
    Mul = 7,
    Div = 8,
    Jmp = 9,
    Branch = 10,
    Call = 11,
    Ret = 12,
    Halt = 13,
    Data = 14,
    Loop = 15,
    Jal = 16,
    Or = 129,
    Sll = 131,
}

impl Opcode {
    /// Parse opcode from string
    pub fn from_str(s: &str) -> Option<Self> {
        match s.to_uppercase().as_str() {
            "NOP" => Some(Self::Nop),
            "LDI" => Some(Self::Ldi),
            "MOV" => Some(Self::Mov),
            "LOAD" => Some(Self::Load),
            "STORE" => Some(Self::Store),
            "ADD" => Some(Self::Add),
            "SUB" => Some(Self::Sub),
            "MUL" => Some(Self::Mul),
            "DIV" => Some(Self::Div),
            "JMP" => Some(Self::Jmp),
            "BRANCH" | "BNE" | "BEQ" | "BLT" | "BGE" | "BLTU" | "BGEU" => Some(Self::Branch),
            "CALL" => Some(Self::Call),
            "RET" | "RETURN" => Some(Self::Ret),
            "HALT" => Some(Self::Halt),
            "DATA" => Some(Self::Data),
            "LOOP" => Some(Self::Loop),
            "JAL" => Some(Self::Jal),
            "OR" => Some(Self::Or),
            "SLL" => Some(Self::Sll),
            _ => None,
        }
    }
}

/// Branch condition type (stratum field)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum BranchCond {
    Beq = 0,
    Bne = 1,
    Blt = 2,
    Bge = 3,
    Bltu = 4,
    Bgeu = 5,
}

impl BranchCond {
    pub fn from_str(s: &str) -> Option<Self> {
        match s.to_uppercase().as_str() {
            "BEQ" => Some(Self::Beq),
            "BNE" => Some(Self::Bne),
            "BLT" => Some(Self::Blt),
            "BGE" => Some(Self::Bge),
            "BLTU" => Some(Self::Bltu),
            "BGEU" => Some(Self::Bgeu),
            _ => None,
        }
    }
}

/// A single instruction
#[derive(Debug, Clone)]
pub struct Instruction {
    pub opcode: Opcode,
    pub stratum: u8,
    pub p1: u8,
    pub p2: u8,
}

impl Instruction {
    /// Encode to 32-bit glyph format
    pub fn encode(&self) -> u32 {
        (self.opcode as u32)
            | ((self.stratum as u32) << 8)
            | ((self.p1 as u32) << 16)
            | ((self.p2 as u32) << 24)
    }
}

/// Parse register name to index (r0-r127)
fn parse_reg(s: &str) -> Option<u8> {
    let s = s.trim().trim_end_matches(',');
    if s.starts_with('r') || s.starts_with('R') {
        s[1..].parse::<u8>().ok().filter(|&r| r < 128)
    } else {
        None
    }
}

/// Parse immediate value (decimal or hex)
fn parse_imm(s: &str) -> Option<i32> {
    let s = s.trim();
    if s.starts_with("0x") || s.starts_with("0X") {
        i32::from_str_radix(&s[2..], 16).ok()
    } else if s.starts_with("-0x") || s.starts_with("-0X") {
        // Parse negative hex: -0xFF -> -255
        i32::from_str_radix(&s[3..], 16).ok().map(|v| -v)
    } else if s.starts_with('-') {
        // Negative decimal: -42
        s.parse::<i32>().ok()
    } else {
        s.parse::<i32>().ok()
    }
}

/// Assembled program
#[derive(Debug, Clone)]
pub struct AssembledProgram {
    /// Labels to addresses
    pub labels: HashMap<String, u32>,
    /// Raw instructions and data
    pub words: Vec<u32>,
}

impl AssembledProgram {
    pub fn new() -> Self {
        Self {
            labels: HashMap::new(),
            words: Vec::new(),
        }
    }

    /// Get total size in words
    pub fn len(&self) -> usize {
        self.words.len()
    }

    /// Get words as bytes (little-endian)
    pub fn to_bytes(&self) -> Vec<u8> {
        let mut bytes = Vec::with_capacity(self.words.len() * 4);
        for word in &self.words {
            bytes.extend_from_slice(&word.to_le_bytes());
        }
        bytes
    }
}

/// Glyph Assembler - compiles text to opcodes
pub struct GlyphAssembler {
    /// Current address
    addr: u32,
    /// Labels
    labels: HashMap<String, u32>,
    /// Forward references to resolve
    forward_refs: Vec<(u32, String)>,
    /// Output words
    words: Vec<u32>,
}

impl GlyphAssembler {
    pub fn new() -> Self {
        Self {
            addr: 0,
            labels: HashMap::new(),
            forward_refs: Vec::new(),
            words: Vec::new(),
        }
    }

    /// Assemble text to program
    pub fn assemble(&mut self, text: &str) -> Result<AssembledProgram, String> {
        self.addr = 0;
        self.labels.clear();
        self.forward_refs.clear();
        self.words.clear();

        // First pass: collect labels
        let lines: Vec<&str> = text.lines().collect();
        for line in &lines {
            let line = Self::strip_comment(line).trim();
            if line.is_empty() {
                continue;
            }

            // Check for label
            if line.ends_with(':') {
                let label = line[..line.len()-1].trim().to_string();
                self.labels.insert(label, self.addr);
            } else if line.starts_with(':') {
                let label = line[1..].trim().to_string();
                self.labels.insert(label, self.addr);
            } else {
                // Count words for this instruction
                let word_count = self.count_words(line)?;
                self.addr += word_count;
            }
        }

        // Second pass: assemble
        self.addr = 0;
        for line in &lines {
            let line = Self::strip_comment(line).trim();
            if line.is_empty() || line.ends_with(':') || line.starts_with(':') {
                continue;
            }

            self.assemble_line(line)?;
        }

        // Resolve forward references
        for (ref_addr, label) in &self.forward_refs {
            let target = self.labels.get(label)
                .ok_or_else(|| format!("Undefined label: {}", label))?;
            let offset = (*target as i32) - (*ref_addr as i32);
            // Branch offset is relative to instruction after branch
            // PC = addr + 2 + offset = target
            // offset = target - addr - 2
            let branch_offset = offset - 2;
            self.words[*ref_addr as usize] = branch_offset as u32;
        }

        Ok(AssembledProgram {
            labels: self.labels.clone(),
            words: self.words.clone(),
        })
    }

    /// Strip comment from line
    fn strip_comment(line: &str) -> &str {
        if let Some(pos) = line.find(';') {
            &line[..pos]
        } else if let Some(pos) = line.find("//") {
            &line[..pos]
        } else {
            line
        }
    }

    /// Count words for an instruction (1 or 2)
    fn count_words(&self, line: &str) -> Result<u32, String> {
        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.is_empty() {
            return Ok(0);
        }

        let opcode = Opcode::from_str(parts[0])
            .ok_or_else(|| format!("Unknown opcode: {}", parts[0]))?;

        // LDI and BRANCH take 2 words (instruction + data)
        Ok(if opcode == Opcode::Ldi || opcode == Opcode::Branch { 2 } else { 1 })
    }

    /// Assemble a single line
    fn assemble_line(&mut self, line: &str) -> Result<(), String> {
        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.is_empty() {
            return Ok(());
        }

        let opcode_str = parts[0].to_uppercase();
        let opcode = Opcode::from_str(&opcode_str)
            .ok_or_else(|| format!("Unknown opcode: {}", opcode_str))?;

        let (instr, data) = match opcode {
            Opcode::Nop => {
                (Instruction { opcode, stratum: 0, p1: 0, p2: 0 }, None)
            }
            Opcode::Halt => {
                (Instruction { opcode, stratum: 0, p1: 0, p2: 0 }, None)
            }
            Opcode::Ldi => {
                // LDI rX, imm
                let rd = parse_reg(parts.get(1).ok_or("LDI needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let imm = parts.get(2).ok_or("LDI needs immediate value")?;
                let imm_val = parse_imm(imm.trim_end_matches(','))
                    .or_else(|| {
                        // Try as label (with or without : prefix)
                        let label = imm.trim_end_matches(',').trim_start_matches(':');
                        if self.labels.contains_key(label) {
                            Some(*self.labels.get(label)? as i32)
                        } else {
                            None
                        }
                    })
                    .ok_or_else(|| format!("Invalid immediate: {}", imm))?;
                (Instruction { opcode, stratum: 0, p1: rd, p2: 0 }, Some(imm_val))
            }
            Opcode::Add => {
                // ADD rd, rs1, rs2 or ADD rd = rs1 + rs2
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (Instruction { opcode, stratum: 0, p1: rs1, p2: rd }, None)
                // Note: encoding is ADD rd = rs1 + rd, so we swap
            }
            Opcode::Sub => {
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (Instruction { opcode, stratum: 0, p1: rs1, p2: rd }, None)
            }
            Opcode::Mul => {
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (Instruction { opcode, stratum: 0, p1: rs1, p2: rd }, None)
            }
            Opcode::Load => {
                // LOAD rd, [rs] or LOAD rd = mem[rs]
                let rd = parse_reg(parts.get(1).ok_or("LOAD needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let rs = parts.get(2).ok_or("LOAD needs source register")?;
                let rs = rs.trim_start_matches('[').trim_start_matches("mem")
                    .trim_start_matches('[').trim_end_matches(']');
                let rs = parse_reg(rs)
                    .ok_or_else(|| format!("Invalid source register: {}", rs))?;
                (Instruction { opcode, stratum: 0, p1: rs, p2: rd }, None)
            }
            Opcode::Store => {
                // STORE [rd], rs or STORE mem[rd], rs
                let addr_part = parts.get(1).ok_or("STORE needs address register")?;
                let addr_part = addr_part.trim_end_matches(','); // Remove trailing comma
                let addr_reg = addr_part.trim_start_matches('[').trim_start_matches("mem")
                    .trim_start_matches('[').trim_end_matches(']');
                let rd = parse_reg(addr_reg)
                    .ok_or_else(|| format!("Invalid address register: {}", addr_part))?;
                let val_part = parts.get(2).ok_or("STORE needs value register")?;
                let rs = parse_reg(val_part.trim_end_matches(','))
                    .ok_or_else(|| format!("Invalid value register: {}", val_part))?;
                (Instruction { opcode, stratum: 0, p1: rd, p2: rs }, None)
            }
            Opcode::Branch => {
                // BRANCH cond r1, r2, target
                // BNE r1, r2, label
                let (cond, r1, r2, target) = self.parse_branch(&parts)?;
                (Instruction { opcode, stratum: cond as u8, p1: r1, p2: r2 }, Some(target))
            }
            Opcode::Call => {
                // CALL rs | CALL :label
                let arg = parts.get(1).ok_or("CALL needs register or label")?;
                // Try register first
                if let Some(rs) = parse_reg(arg) {
                    (Instruction { opcode, stratum: 0, p1: rs, p2: 0 }, None)
                } else if arg.starts_with(':') {
                    // Label reference - use PC-relative encoding (stratum=2)
                    let label = arg[1..].to_string();
                    let target = *self.labels.get(&label).unwrap_or(&0) as i32;
                    let next_pc = self.addr as i32 + 1;
                    let offset = target - next_pc;
                    let offset = offset.clamp(-32768, 32767) as i16 as u16;
                    (Instruction { opcode, stratum: 2, p1: (offset & 0xFF) as u8, p2: ((offset >> 8) & 0xFF) as u8 }, None)
                } else {
                    return Err(format!("Invalid CALL operand: {}", arg));
                }
            }
            Opcode::Mov => {
                // MOV rd, rs
                let rd = parse_reg(parts.get(1).ok_or("MOV needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let rs = parse_reg(parts.get(2).ok_or("MOV needs source register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[2]))?;
                (Instruction { opcode, stratum: 0, p1: rs, p2: rd }, None)
            }
            Opcode::Jmp => {
                // JMP rs | JMP :label
                let arg = parts.get(1).ok_or("JMP needs register or label")?;
                // Try register first
                if let Some(rs) = parse_reg(arg) {
                    (Instruction { opcode, stratum: 0, p1: rs, p2: 0 }, None)
                } else if arg.starts_with(':') {
                    // Label reference - use PC-relative encoding (stratum=2)
                    let label = arg[1..].to_string();
                    let target = *self.labels.get(&label).unwrap_or(&0) as i32;
                    let next_pc = self.addr as i32 + 1;
                    let offset = target - next_pc;
                    let offset = offset.clamp(-32768, 32767) as i16 as u16;
                    (Instruction { opcode, stratum: 2, p1: (offset & 0xFF) as u8, p2: ((offset >> 8) & 0xFF) as u8 }, None)
                } else {
                    return Err(format!("Invalid JMP operand: {}", arg));
                }
            }
            Opcode::Ret => {
                (Instruction { opcode, stratum: 0, p1: 0, p2: 0 }, None)
            }
            Opcode::Or => {
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (Instruction { opcode, stratum: 0, p1: rs1, p2: rd }, None)
            }
            Opcode::Sll => {
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (Instruction { opcode, stratum: 0, p1: rs1, p2: rd }, None)
            }
            _ => {
                (Instruction { opcode, stratum: 0, p1: 0, p2: 0 }, None)
            }
        };

        // Emit instruction
        self.words.push(instr.encode());
        self.addr += 1;

        // Emit data if present
        if let Some(data) = data {
            if let Some(label) = self.extract_label_ref(&parts) {
                if !self.labels.contains_key(&label) {
                    // Forward reference, will resolve later
                    self.forward_refs.push((self.addr, label));
                    self.words.push(0); // Placeholder
                } else {
                    let target = self.labels[&label] as i32;
                    let branch_offset = target - (self.addr as i32) - 1;
                    self.words.push(branch_offset as u32);
                }
            } else {
                self.words.push(data as u32);
            }
            self.addr += 1;
        }

        Ok(())
    }

    /// Parse three registers from args
    fn parse_three_regs(&self, args: &[&str]) -> Result<(u8, u8, u8), String> {
        // Format: rd, rs1, rs2 or rd = rs1 + rs2
        let clean_args: Vec<&str> = args.iter()
            .map(|s| s.trim_end_matches(',').trim())
            .collect();

        if clean_args.len() >= 3 {
            let rd = parse_reg(clean_args[0])
                .ok_or_else(|| format!("Invalid register: {}", clean_args[0]))?;
            let rs1 = parse_reg(clean_args[1])
                .ok_or_else(|| format!("Invalid register: {}", clean_args[1]))?;
            let rs2 = parse_reg(clean_args[2])
                .ok_or_else(|| format!("Invalid register: {}", clean_args[2]))?;
            Ok((rd, rs1, rs2))
        } else {
            Err("Need three registers".to_string())
        }
    }

    /// Parse branch instruction
    fn parse_branch(&self, parts: &[&str]) -> Result<(BranchCond, u8, u8, i32), String> {
        // BNE r1, r2, label
        // BRANCH BNE r1, r2, label
        let offset = if parts[0].to_uppercase() == "BRANCH" { 1 } else { 0 };

        let cond = if parts[0].to_uppercase() == "BRANCH" {
            BranchCond::from_str(parts[1]).ok_or_else(|| format!("Invalid condition: {}", parts[1]))?
        } else {
            BranchCond::from_str(parts[0])
                .ok_or_else(|| format!("Invalid branch type: {}", parts[0]))?
        };

        let r1 = parse_reg(parts.get(1 + offset).ok_or("Branch needs r1")?)
            .ok_or_else(|| format!("Invalid register: {}", parts[1 + offset]))?;
        let r2 = parse_reg(parts.get(2 + offset).ok_or("Branch needs r2")?)
            .ok_or_else(|| format!("Invalid register: {}", parts[2 + offset]))?;

        let target_str = parts.get(3 + offset).ok_or("Branch needs target")?;
        let target = parse_imm(target_str)
            .or_else(|| self.labels.get(*target_str).map(|&a| a as i32))
            .unwrap_or(0); // Will be resolved later

        Ok((cond, r1, r2, target))
    }

    /// Extract label reference from instruction
    fn extract_label_ref(&self, parts: &[&str]) -> Option<String> {
        for part in parts {
            let cleaned = part.trim_end_matches(',');
            // Handle :label syntax
            if cleaned.starts_with(':') {
                return Some(cleaned[1..].to_string());
            }
            if cleaned.starts_with(|c: char| c.is_alphabetic()) && !cleaned.starts_with('r') && !cleaned.starts_with('R') {
                // Could be a label
                if Opcode::from_str(cleaned).is_none() && BranchCond::from_str(cleaned).is_none() {
                    return Some(cleaned.to_string());
                }
            }
        }
        None
    }
}

impl Default for GlyphAssembler {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_nop_encoding() {
        let instr = Instruction { opcode: Opcode::Nop, stratum: 0, p1: 0, p2: 0 };
        assert_eq!(instr.encode(), 0x00000000);
    }

    #[test]
    fn test_halt_encoding() {
        let instr = Instruction { opcode: Opcode::Halt, stratum: 0, p1: 0, p2: 0 };
        assert_eq!(instr.encode(), 0x0000000D);
    }

    #[test]
    fn test_ldi_encoding() {
        let instr = Instruction { opcode: Opcode::Ldi, stratum: 0, p1: 5, p2: 0 };
        assert_eq!(instr.encode(), 0x00050001);
    }

    #[test]
    fn test_assemble_simple() {
        let mut asm = GlyphAssembler::new();
        let program = asm.assemble(r#"
            LDI r0, 42
            LDI r1, 100
            STORE mem[r1], r0
            HALT
        "#).unwrap();

        assert_eq!(program.len(), 6);
        assert_eq!(program.words[0], 0x00000001); // LDI r0
        assert_eq!(program.words[1], 42);          // DATA: 42
        assert_eq!(program.words[4], 0x00010004); // STORE mem[r1], r0
        assert_eq!(program.words[5], 0x0000000D); // HALT
    }

    #[test]
    fn test_assemble_with_label() {
        let mut asm = GlyphAssembler::new();
        let program = asm.assemble(r#"
        start:
            LDI r0, 0
            LDI r1, 1
            ADD r0, r0, r1
            BNE r1, r0, start
            HALT
        "#).unwrap();

        assert!(program.labels.contains_key("start"));
        assert_eq!(program.labels["start"], 0);
    }

    #[test]
    fn test_assemble_self_replication() {
        let mut asm = GlyphAssembler::new();
        let program = asm.assemble(r#"
            ; Self-replicating glyph
            LDI r0, 0           ; src = 0
            LDI r1, 100         ; dst = 100
            LDI r2, 0           ; counter = 0
            LDI r3, 1           ; increment = 1
            LDI r4, 18          ; length = 18
        loop:
            LOAD r5, [r0]       ; r5 = mem[r0]
            STORE [r1], r5      ; mem[r1] = r5
            ADD r0, r3, r0      ; src++
            ADD r1, r3, r1      ; dst++
            ADD r2, r3, r2      ; counter++
            BNE r2, r4, loop    ; if counter != length, loop
            HALT
        "#).unwrap();

        // 5 LDI (2 words each) + 1 LOAD + 1 STORE + 3 ADD + 1 BNE (2 words) + 1 HALT = 18 words
        assert_eq!(program.len(), 18);
        assert!(program.labels.contains_key("loop"));
    }
}
