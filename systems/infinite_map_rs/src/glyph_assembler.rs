//! Glyph Assembler
//!
//! Compiles text assembly to GPU opcodes that can run on the Glyph VM.
//! This is the key to self-hosting: programs writing programs.

use std::collections::HashMap;

/// Opcodes for the Glyph VM (Aligned ISA)
///
/// These match the WGSL scheduler in shaders/glyph_vm_scheduler.wgsl
/// and the synthetic_vram.rs CPU emulator.
///
/// **WARNING:** Do NOT use the legacy Python extended opcodes:
/// - LDI was 204, now 1
/// - MOV was 206, now 2
/// - JMP was 209, now 9
///
/// The aligned ISA ensures GPU sovereignty without CPU translation.
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
    And = 128,
    Or = 129,
    Xor = 130,
    Sll = 131,
    Srl = 132,
    Sra = 133,
    // Memory-based operations (211+)
    Cmp = 211, // CMP - compare values, write result to memory
    // Conditional jumps (check comparison result)
    Je = 220,  // JE - Jump if Equal (checks CMP result)
    Jne = 221, // JNE - Jump if Not Equal (checks CMP result)
    Jlt = 222, // JLT - Jump if Less Than
    Jgt = 223, // JGT - Jump if Greater Than
    Jge = 224, // JGE - Jump if Greater or Equal
    Spawn = 230, // SPAWN - spawn a new VM
    // Spatial/GPU opcodes (200-227)
    Draw = 215, // DRAW glyph_id, x, y - blit from atlas to screen
    Yield = 227, // YIELD - cooperative multitasking, return control to scheduler
}

impl Opcode {
    /// Parse opcode from string
    pub fn from_str(s: &str) -> Option<Self> {
        match s.to_uppercase().as_str() {
            "NOP" => Some(Self::Nop),
            "LDI" => Some(Self::Ldi),
            "MOV" => Some(Self::Mov),
            "LOAD" | "LD" => Some(Self::Load),
            "STORE" | "ST" => Some(Self::Store),
            "ADD" => Some(Self::Add),
            "SUB" => Some(Self::Sub),
            "MUL" => Some(Self::Mul),
            "DIV" => Some(Self::Div),
            "JMP" | "JUMP" => Some(Self::Jmp),
            "BRANCH" | "BNE" | "BEQ" | "BLT" | "BGE" | "BLTU" | "BGEU" => Some(Self::Branch),
            "CALL" => Some(Self::Call),
            "RET" | "RETURN" => Some(Self::Ret),
            "HALT" | "EXIT" => Some(Self::Halt),
            "DATA" => Some(Self::Data),
            "LOOP" => Some(Self::Loop),
            "JAL" => Some(Self::Jal),
            "AND" => Some(Self::And),
            "OR" => Some(Self::Or),
            "XOR" => Some(Self::Xor),
            "SLL" => Some(Self::Sll),
            "SRL" => Some(Self::Srl),
            "CMP" => Some(Self::Cmp),
            "JE" | "JZ" => Some(Self::Je),
            "JNE" | "JNZ" => Some(Self::Jne),
            "JLT" => Some(Self::Jlt),
            "JGT" => Some(Self::Jgt),
            "JGE" => Some(Self::Jge),
            "SPAWN" => Some(Self::Spawn),
            "DRAW" => Some(Self::Draw),
            "YIELD" => Some(Self::Yield),
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
        u32::from_str_radix(&s[2..], 16).ok().map(|v| v as i32)
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
    /// Labels (code addresses)
    labels: HashMap<String, u32>,
    /// Constants (.equ definitions)
    constants: HashMap<String, i32>,
    /// Forward references to resolve: (address, label, is_absolute)
    /// is_absolute = true for LDI (needs absolute address)
    /// is_absolute = false for branches (needs PC-relative offset)
    forward_refs: Vec<(u32, String, bool)>,
    /// Output words
    words: Vec<u32>,
}

impl GlyphAssembler {
    pub fn new() -> Self {
        Self {
            addr: 0,
            labels: HashMap::new(),
            constants: HashMap::new(),
            forward_refs: Vec::new(),
            words: Vec::new(),
        }
    }

    /// Parse .equ directive: .equ NAME, value
    fn parse_equ(line: &str) -> Option<(String, i32)> {
        let line = line.trim();
        if !line.to_lowercase().starts_with(".equ") {
            return None;
        }
        // .equ NAME, value or .equ NAME value
        let rest = &line[4..].trim();
        let parts: Vec<&str> = rest.split(&[',', ' '][..]).filter(|s| !s.is_empty()).collect();
        if parts.len() < 2 {
            return None;
        }
        let name = parts[0].to_string();
        let value = parse_imm(parts[1])?;
        Some((name, value))
    }

    /// Replace constant names in operands with their values
    fn expand_constants(&self, parts: &mut Vec<&str>) {
        for i in 1..parts.len() {
            if let Some(&value) = self.constants.get(parts[i]) {
                // Replace the constant name with its value
                // This is a bit tricky since we have &str references
                // We'll handle this in the operand parsing instead
            }
        }
    }

    /// Resolve a symbol to its value (label address or constant value)
    fn resolve_symbol(&self, name: &str) -> Option<i32> {
        // First check constants
        if let Some(&value) = self.constants.get(name) {
            return Some(value);
        }
        // Then check labels (return address)
        if let Some(&addr) = self.labels.get(name) {
            return Some(addr as i32);
        }
        None
    }

    /// Assemble text to program
    pub fn assemble(&mut self, text: &str) -> Result<AssembledProgram, String> {
        self.addr = 0;
        self.labels.clear();
        self.constants.clear();
        self.forward_refs.clear();
        self.words.clear();

        // First pass: collect labels and constants
        eprintln!("DEBUG: First pass - collecting labels and constants");
        for line in text.lines() {
            let line = Self::strip_comment(line).trim();
            let line = line.trim_start_matches('@');
            if line.is_empty() {
                continue;
            }

            // Handle .equ directives - they don't consume words
            if let Some((name, value)) = Self::parse_equ(line) {
                eprintln!("  Found constant '{}' = {}", name, value);
                self.constants.insert(name, value);
                continue;
            }

            // Handle labels - extract label name stopping at semicolon
            let remaining_line = if line.starts_with(':') {
                let label_end = line.find(';').unwrap_or(line.len());
                let label = line[1..label_end].trim().to_string();
                eprintln!("  Found label '{}' at addr {}", label, self.addr);
                self.labels.insert(label, self.addr);
                if label_end < line.len() {
                    &line[label_end..]
                } else {
                    ""
                }
            } else if line.ends_with(':') {
                let label = line[..line.len() - 1].trim().to_string();
                eprintln!("  Found label '{}' at addr {}", label, self.addr);
                self.labels.insert(label, self.addr);
                ""
            } else {
                line
            };

            // Count words for any instructions after the label
            if !remaining_line.is_empty() {
                let word_count = self.count_words(remaining_line)?;
                self.addr += word_count;
            }
        }
        eprintln!("DEBUG: First pass done, total words = {}", self.addr);
        eprintln!("DEBUG: Labels collected:");
        for (name, addr) in &self.labels {
            eprintln!("  {} = {:#04X}", name, addr);
        }
        eprintln!("DEBUG: Constants collected:");
        for (name, value) in &self.constants {
            eprintln!("  {} = {:#04X}", name, value);
        }

        // Second pass: assemble
        self.addr = 0;
        for line in text.lines() {
            let line = Self::strip_comment(line).trim();
            let line = line.trim_start_matches('@');
            if line.is_empty() {
                continue;
            }

            // Skip .equ directives in second pass
            if Self::parse_equ(line).is_some() {
                continue;
            }

            // Handle labels at start of line - skip the label, process instructions
            let remaining_line = if line.starts_with(':') {
                let label_end = line.find(';').unwrap_or(line.len());
                if label_end < line.len() {
                    line[label_end..].trim()
                } else {
                    ""
                }
            } else if line.ends_with(':') {
                "" // Label-only line, no instructions
            } else {
                line
            };

            if remaining_line.is_empty() {
                continue;
            }
            self.assemble_line(remaining_line)?;
        }

        // Resolve forward references
        eprintln!(
            "\nDEBUG: Resolving {} forward references:",
            self.forward_refs.len()
        );
        for (ref_addr, label, is_absolute) in &self.forward_refs {
            let target = self
                .labels
                .get(label)
                .ok_or_else(|| format!("Undefined label: {}", label))?;

            eprintln!(
                "  Forward ref: addr={}, label={}, is_absolute={}, target={}",
                ref_addr, label, is_absolute, target
            );

            let value = if *is_absolute {
                // LDI needs absolute address
                *target as i32
            } else {
                // Branch offset is relative to instruction after branch
                // PC = addr + 2 + offset = target
                // offset = target - addr - 2
                let offset = (*target as i32) - (*ref_addr as i32);
                offset - 2
            };
            eprintln!("    -> Writing value {} to words[{}]", value, ref_addr);
            self.words[*ref_addr as usize] = value as u32;
        }

        Ok(AssembledProgram {
            labels: self.labels.clone(),
            words: self.words.clone(),
        })
    }

    /// Strip comment from line
    /// Note: Semicolons are used to separate instructions, not for comments.
    /// Comments are marked with // only.
    fn strip_comment(line: &str) -> &str {
        if let Some(pos) = line.find("//") {
            &line[..pos]
        } else {
            line
        }
    }

    /// Count words for an instruction (1 or 2)
    fn count_words(&self, line: &str) -> Result<u32, String> {
        // Skip .equ directives - they don't generate code
        if Self::parse_equ(line).is_some() {
            return Ok(0);
        }
        // Handle semicolon-separated instructions on one line
        // Semicolons can also introduce comments - skip non-opcode segments
        let mut total = 0u32;
        for sub_line in line.split(';') {
            let sub_line = sub_line.trim();
            if sub_line.is_empty() {
                continue;
            }
            let parts: Vec<&str> = sub_line.split_whitespace().collect();
            if parts.is_empty() {
                continue;
            }
            // Skip if not a valid opcode (treat as comment)
            let Some(opcode) = Opcode::from_str(parts[0]) else {
                continue;
            };

            // LDI, BRANCH, and CMP with immediate take 2 words (instruction + data)
            let needs_data = opcode == Opcode::Ldi 
                || opcode == Opcode::Branch
                || (opcode == Opcode::Cmp && parts.len() > 2 && !parse_reg(parts[2]).is_some());
            total += if needs_data { 2 } else { 1 };
        }
        Ok(total)
    }

    /// Assemble a single line (may contain semicolon-separated instructions)
    fn assemble_line(&mut self, line: &str) -> Result<(), String> {
        // Handle semicolon-separated instructions on one line
        // Semicolons can also introduce comments - skip non-opcode segments
        for sub_line in line.split(';') {
            let sub_line = sub_line.trim();
            if sub_line.is_empty() {
                continue;
            }
            // Check if this looks like an instruction (starts with opcode)
            let first_word = sub_line.split_whitespace().next().unwrap_or("");
            if Opcode::from_str(first_word).is_none() {
                // Not a valid opcode - treat as comment
                continue;
            }
            self.assemble_single_instruction(sub_line)?;
        }
        Ok(())
    }

    /// Assemble a single instruction
    fn assemble_single_instruction(&mut self, line: &str) -> Result<(), String> {
        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.is_empty() {
            return Ok(());
        }

        let opcode_str = parts[0].to_uppercase();
        let opcode = Opcode::from_str(&opcode_str)
            .ok_or_else(|| format!("Unknown opcode: {}", opcode_str))?;

        let (instr, data) = match opcode {
            Opcode::Nop => (
                Instruction {
                    opcode,
                    stratum: 0,
                    p1: 0,
                    p2: 0,
                },
                None,
            ),
            Opcode::Halt => (
                Instruction {
                    opcode,
                    stratum: 0,
                    p1: 0,
                    p2: 0,
                },
                None,
            ),
            Opcode::Ldi => {
                // LDI rX, imm or LDI rX, :label
                let rd = parse_reg(parts.get(1).ok_or("LDI needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let imm = parts.get(2).ok_or("LDI needs immediate value")?;
                let imm_str = imm.trim_end_matches(',');

                // Try immediate value first
                let imm_val = if let Some(v) = parse_imm(imm_str) {
                    v
                } else {
                    // Try as label (with or without : prefix)
                    let label = imm_str.trim_start_matches(':');
                    if self.labels.contains_key(label) {
                        *self.labels.get(label).unwrap() as i32
                    } else if imm_str.starts_with(':') || !label.is_empty() {
                        // Forward reference or label syntax - use 0, will be resolved later
                        // The forward reference mechanism will catch this if it starts with ':'
                        0
                    } else {
                        return Err(format!("Invalid immediate: {}", imm));
                    }
                };
                (
                    Instruction {
                        opcode,
                        stratum: 0,
                        p1: rd,
                        p2: 0,
                    },
                    Some(imm_val),
                )
            },
            Opcode::Add => {
                // ADD rd, rs1, rs2 → rd = rs1 + rs2 (three-operand form)
                // ADD rd, rs1, imm → rd = rs1 + imm (immediate form)
                let rd = parse_reg(parts.get(1).ok_or("ADD needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let rs1 = parse_reg(parts.get(2).ok_or("ADD needs source register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[2]))?;
                let third = parts.get(3).ok_or("ADD needs third operand")?;
                let third = third.trim_end_matches(',');
                
                if let Some(rs2) = parse_reg(third) {
                    // Register form
                    (
                        Instruction {
                            opcode,
                            stratum: rs2,
                            p1: rs1,
                            p2: rd,
                        },
                        None,
                    )
                } else {
                    // Immediate form (also resolve .equ constants)
                    let imm = if let Some(v) = third.parse::<i32>().ok() {
                        v
                    } else if let Some(v) = self.resolve_symbol(third) {
                        v
                    } else {
                        return Err(format!("Invalid immediate: {}", third));
                    };
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rs1,
                            p2: rd,
                        },
                        Some(imm),
                    )
                }
            },
            Opcode::Sub => {
                // SUB rd, rs1, rs2 → rd = rs1 - rs2 (three-operand form)
                // SUB rd, rs1, imm → rd = rs1 - imm (immediate form)
                let rd = parse_reg(parts.get(1).ok_or("SUB needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let rs1 = parse_reg(parts.get(2).ok_or("SUB needs source register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[2]))?;
                let third = parts.get(3).ok_or("SUB needs third operand")?;
                let third = third.trim_end_matches(',');
                
                if let Some(rs2) = parse_reg(third) {
                    // Register form
                    (
                        Instruction {
                            opcode,
                            stratum: rs2,
                            p1: rs1,
                            p2: rd,
                        },
                        None,
                    )
                } else {
                    // Immediate form (also resolve .equ constants)
                    let imm = if let Some(v) = third.parse::<i32>().ok() {
                        v
                    } else if let Some(v) = self.resolve_symbol(third) {
                        v
                    } else {
                        return Err(format!("Invalid immediate: {}", third));
                    };
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rs1,
                            p2: rd,
                        },
                        Some(imm),
                    )
                }
            },
            Opcode::Mul => {
                // MUL rd, rs1, rs2 → rd = rs1 * rs2 (three-operand form)
                // MUL rd, rs1, imm → rd = rs1 * imm (immediate form)
                let rd = parse_reg(parts.get(1).ok_or("MUL needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let rs1 = parse_reg(parts.get(2).ok_or("MUL needs source register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[2]))?;
                let third = parts.get(3).ok_or("MUL needs third operand")?;
                let third = third.trim_end_matches(',');
                
                if let Some(rs2) = parse_reg(third) {
                    // Register form
                    (
                        Instruction {
                            opcode,
                            stratum: rs2,
                            p1: rs1,
                            p2: rd,
                        },
                        None,
                    )
                } else {
                    // Immediate form (also resolve .equ constants)
                    let imm = if let Some(v) = third.parse::<i32>().ok() {
                        v
                    } else if let Some(v) = self.resolve_symbol(third) {
                        v
                    } else {
                        return Err(format!("Invalid immediate: {}", third));
                    };
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rs1,
                            p2: rd,
                        },
                        Some(imm),
                    )
                }
            },
            Opcode::Load => {
                // LOAD rd, [rs] or LOAD rd, rs or LOAD rd, addr (constant/immediate)
                let rd = parse_reg(parts.get(1).ok_or("LOAD needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let src = parts.get(2).ok_or("LOAD needs source")?;
                let src = src.trim_end_matches(',');
                
                // Check if it's register indirect [rs] or constant address
                if src.starts_with('[') || src.starts_with("mem[") {
                    // Register indirect with brackets: LOAD rd, [rs]
                    let rs = src
                        .trim_start_matches('[')
                        .trim_start_matches("mem")
                        .trim_start_matches('[')
                        .trim_end_matches(']');
                    let rs = parse_reg(rs).ok_or_else(|| format!("Invalid source register: {}", rs))?;
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rs,
                            p2: rd,
                        },
                        None,
                    )
                } else if let Some(rs) = parse_reg(src) {
                    // Register indirect without brackets: LOAD rd, rs
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rs,
                            p2: rd,
                        },
                        None,
                    )
                } else {
                    // Constant/immediate address: LOAD rd, addr
                    // Uses 2-word encoding (instruction + address data)
                    let addr = if let Some(v) = parse_imm(src) {
                        v
                    } else if let Some(v) = self.resolve_symbol(src) {
                        v
                    } else {
                        return Err(format!("Invalid address: {}", src));
                    };
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: 0, // immediate marker
                            p2: rd,
                        },
                        Some(addr),
                    )
                }
            },
            Opcode::Store => {
                // STORE [rd], rs or STORE rd, rs or STORE addr, rs (constant/immediate)
                let addr_part = parts.get(1).ok_or("STORE needs address")?;
                let addr_part = addr_part.trim_end_matches(',');
                let val_part = parts.get(2).ok_or("STORE needs value register")?;
                let rs = parse_reg(val_part.trim_end_matches(','))
                    .ok_or_else(|| format!("Invalid value register: {}", val_part))?;

                // Check if it's register indirect [rd], rd (without brackets), or constant address
                if addr_part.starts_with('[') || addr_part.starts_with("mem[") {
                    // Register indirect with brackets: STORE [rd], rs
                    let addr_reg = addr_part
                        .trim_start_matches('[')
                        .trim_start_matches("mem")
                        .trim_start_matches('[')
                        .trim_end_matches(']');
                    let rd = parse_reg(addr_reg)
                        .ok_or_else(|| format!("Invalid address register: {}", addr_part))?;
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rd,
                            p2: rs,
                        },
                        None,
                    )
                } else if let Some(rd) = parse_reg(addr_part) {
                    // Register indirect without brackets: STORE rd, rs
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rd,
                            p2: rs,
                        },
                        None,
                    )
                } else {
                    // Constant/immediate address: STORE addr, rs
                    // Uses 2-word encoding (instruction + address data)
                    let addr = if let Some(v) = parse_imm(addr_part) {
                        v
                    } else if let Some(v) = self.resolve_symbol(addr_part) {
                        v
                    } else {
                        return Err(format!("Invalid address: {}", addr_part));
                    };
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: 0, // immediate marker
                            p2: rs,
                        },
                        Some(addr),
                    )
                }
            },
            Opcode::Branch => {
                // BRANCH cond r1, r2, target
                // BNE r1, r2, label
                let (cond, r1, r2, target) = self.parse_branch(&parts)?;
                (
                    Instruction {
                        opcode,
                        stratum: cond as u8,
                        p1: r1,
                        p2: r2,
                    },
                    Some(target),
                )
            },
            Opcode::Call => {
                // CALL rs | CALL :label
                let arg = parts.get(1).ok_or("CALL needs register or label")?;
                // Try register first
                if let Some(rs) = parse_reg(arg) {
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rs,
                            p2: 0,
                        },
                        None,
                    )
                } else if arg.starts_with(':') {
                    // Label reference - use PC-relative encoding (stratum=2)
                    let label = arg[1..].to_string();
                    let target = *self.labels.get(&label).unwrap_or(&0) as i32;
                    let next_pc = self.addr as i32 + 1;
                    let offset = target - next_pc;
                    let offset = offset.clamp(-32768, 32767) as i16 as u16;
                    (
                        Instruction {
                            opcode,
                            stratum: 2,
                            p1: (offset & 0xFF) as u8,
                            p2: ((offset >> 8) & 0xFF) as u8,
                        },
                        None,
                    )
                } else {
                    return Err(format!("Invalid CALL operand: {}", arg));
                }
            },
            Opcode::Mov => {
                // MOV rd, rs
                let rd = parse_reg(parts.get(1).ok_or("MOV needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let rs = parse_reg(parts.get(2).ok_or("MOV needs source register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[2]))?;
                (
                    Instruction {
                        opcode,
                        stratum: 0,
                        p1: rs,
                        p2: rd,
                    },
                    None,
                )
            },
            Opcode::Jmp => {
                // JMP rs | JMP :label
                let arg = parts.get(1).ok_or("JMP needs register or label")?;
                // Try register first
                if let Some(rs) = parse_reg(arg) {
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rs,
                            p2: 0,
                        },
                        None,
                    )
                } else if arg.starts_with(':') {
                    // Label reference - use PC-relative encoding (stratum=2)
                    let label = arg[1..].to_string();
                    let target = *self.labels.get(&label).unwrap_or(&0) as i32;
                    let next_pc = self.addr as i32 + 1;
                    let offset = target - next_pc;
                    let offset = offset.clamp(-32768, 32767) as i16 as u16;
                    (
                        Instruction {
                            opcode,
                            stratum: 2,
                            p1: (offset & 0xFF) as u8,
                            p2: ((offset >> 8) & 0xFF) as u8,
                        },
                        None,
                    )
                } else {
                    return Err(format!("Invalid JMP operand: {}", arg));
                }
            },
            Opcode::Ret => (
                Instruction {
                    opcode,
                    stratum: 0,
                    p1: 0,
                    p2: 0,
                },
                None,
            ),
            Opcode::Or => {
                // OR rd, rs1, rs2 → rd = rs1 | rs2 (three-operand form)
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (
                    Instruction {
                        opcode,
                        stratum: rs2,
                        p1: rs1,
                        p2: rd,
                    },
                    None,
                )
            },
            Opcode::And => {
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (
                    Instruction {
                        opcode,
                        stratum: rs2,
                        p1: rs1,
                        p2: rd,
                    },
                    None,
                )
            },
            Opcode::Xor => {
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (
                    Instruction {
                        opcode,
                        stratum: rs2,
                        p1: rs1,
                        p2: rd,
                    },
                    None,
                )
            },
            Opcode::Sll => {
                // SLL rd, rs1, rs2 (three-operand form)
                // Encodes as: opcode=131, stratum=rs2, p1=rs1, p2=rd
                // VM behavior: rd = rs1 << (rs2 & 31)
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (
                    Instruction {
                        opcode,
                        stratum: rs2,
                        p1: rs1,
                        p2: rd,
                    },
                    None,
                )
            },
            Opcode::Srl => {
                // SRL rd, rs1, rs2 (three-operand form)
                // Encodes as: opcode=132, stratum=rs2, p1=rs1, p2=rd
                let (rd, rs1, rs2) = self.parse_three_regs(&parts[1..])?;
                (
                    Instruction {
                        opcode,
                        stratum: rs2,
                        p1: rs1,
                        p2: rd,
                    },
                    None,
                )
            },
            Opcode::Cmp => {
                // CMP rd, rs → compare rd with rs, store result in rd
                // CMP rd, imm → compare rd with immediate, store result in rd
                let rd = parse_reg(parts.get(1).ok_or("CMP needs destination register")?)
                    .ok_or_else(|| format!("Invalid register: {}", parts[1]))?;
                let val_part = parts.get(2).ok_or("CMP needs comparison value")?;
                let val_part = val_part.trim_end_matches(',');
                
                if let Some(rs) = parse_reg(val_part) {
                    // Register comparison
                    (
                        Instruction {
                            opcode,
                            stratum: rs,
                            p1: rd,
                            p2: 0,
                        },
                        None,
                    )
                } else {
                    // Immediate comparison (also resolve .equ constants)
                    let imm = if let Some(v) = val_part.parse::<i32>().ok() {
                        v
                    } else if let Some(v) = self.resolve_symbol(val_part) {
                        v
                    } else {
                        return Err(format!("Invalid immediate: {}", val_part));
                    };
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rd,
                            p2: 0,
                        },
                        Some(imm),
                    )
                }
            },
            Opcode::Je | Opcode::Jne | Opcode::Jlt | Opcode::Jgt | Opcode::Jge => {
                // Conditional jumps: JE/JNE/JLT/JGT/JGE label
                let label_part = parts.get(1).ok_or("Conditional jump needs label")?;
                let label = label_part.trim_start_matches(':').trim_end_matches(',');
                
                (
                    Instruction {
                        opcode,
                        stratum: 0,
                        p1: 0,
                        p2: 0,
                    },
                    Some(0), // Will be resolved by label handling below
                )
            },
            Opcode::Spawn => {
                // SPAWN program_id (immediate) or SPAWN rs (register)
                // SPAWN program_id, arg1, arg2 → spawn new VM
                let prog_part = parts.get(1).ok_or("SPAWN needs program ID or register")?;
                let prog_part = prog_part.trim_end_matches(',');
                let arg1 = parts.get(2).map(|s| s.trim_end_matches(',')).unwrap_or("0");
                
                if let Some(rs) = parse_reg(prog_part) {
                    // Register form: SPAWN rs
                    (
                        Instruction {
                            opcode,
                            stratum: 0,
                            p1: rs,
                            p2: 0,
                        },
                        None,
                    )
                } else {
                    // Immediate form: SPAWN prog_id
                    let prog: u8 = prog_part.parse()
                        .map_err(|_| format!("Invalid program ID: {}", prog_part))?;
                    let a1: u8 = arg1.parse().unwrap_or(0);
                    (
                        Instruction {
                            opcode,
                            stratum: a1,
                            p1: prog,
                            p2: 0,
                        },
                        None,
                    )
                }
            },
            Opcode::Draw => {
                // DRAW glyph_id, x, y - blit 64x64 cell from Atlas to Screen
                // Format: DRAW r_glyph, r_x, r_y
                // Encodes as: opcode=215, stratum=r_y, p1=r_glyph, p2=r_x
                // VM reads: glyph_id = reg[p1], x = reg[p2], y = reg[stratum]
                let (glyph_reg, x_reg, y_reg) = self.parse_three_regs(&parts[1..])?;
                (
                    Instruction {
                        opcode,
                        stratum: y_reg,
                        p1: glyph_reg,
                        p2: x_reg,
                    },
                    None,
                )
            },
            _ => (
                Instruction {
                    opcode,
                    stratum: 0,
                    p1: 0,
                    p2: 0,
                },
                None,
            ),
        };

        // Emit instruction
        self.words.push(instr.encode());
        self.addr += 1;

        // Emit data if present
        if let Some(data) = data {
            if let Some(label) = self.extract_label_ref(&parts) {
                // Determine if this is an absolute or relative reference
                // LDI uses absolute addresses, branches use relative offsets
                let is_absolute = instr.opcode == Opcode::Ldi;

                if !self.labels.contains_key(&label) {
                    // Forward reference, will resolve later
                    self.forward_refs.push((self.addr, label, is_absolute));
                    self.words.push(0); // Placeholder
                } else {
                    let target = self.labels[&label] as i32;
                    if is_absolute {
                        // LDI needs absolute address
                        self.words.push(target as u32);
                    } else {
                        // Branch needs relative offset
                        let branch_offset = target - (self.addr as i32) - 1;
                        self.words.push(branch_offset as u32);
                    }
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
        let clean_args: Vec<&str> = args
            .iter()
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
        let offset = if parts[0].to_uppercase() == "BRANCH" {
            1
        } else {
            0
        };

        let cond = if parts[0].to_uppercase() == "BRANCH" {
            BranchCond::from_str(parts[1])
                .ok_or_else(|| format!("Invalid condition: {}", parts[1]))?
        } else {
            BranchCond::from_str(parts[0])
                .ok_or_else(|| format!("Invalid branch type: {}", parts[0]))?
        };

        let r1 = parse_reg(parts.get(1 + offset).ok_or("Branch needs r1")?)
            .ok_or_else(|| format!("Invalid register: {}", parts[1 + offset]))?;
        let r2 = parse_reg(parts.get(2 + offset).ok_or("Branch needs r2")?)
            .ok_or_else(|| format!("Invalid register: {}", parts[2 + offset]))?;

        let target_str = parts
            .get(3 + offset)
            .ok_or("Branch needs target")?
            .trim_end_matches(',');
        let label_name = if target_str.starts_with(':') {
            &target_str[1..]
        } else {
            target_str
        };

        let target = parse_imm(target_str)
            .or_else(|| self.labels.get(label_name).map(|&a| a as i32))
            .unwrap_or(0); // Will be resolved by forward_refs if missing

        Ok((cond, r1, r2, target))
    }

    /// Extract label reference from instruction
    fn extract_label_ref(&self, parts: &[&str]) -> Option<String> {
        for part in parts {
            let cleaned = part.trim_end_matches(',');
            if cleaned.starts_with(':') {
                return Some(cleaned[1..].to_string());
            }
            // Check if it's a known label
            if self.labels.contains_key(cleaned) {
                return Some(cleaned.to_string());
            }
        }
        None
    }
    /// Get the address of a label if it exists
    pub fn get_label_addr(&self, name: &str) -> Option<u32> {
        self.labels.get(name).copied()
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
        let instr = Instruction {
            opcode: Opcode::Nop,
            stratum: 0,
            p1: 0,
            p2: 0,
        };
        assert_eq!(instr.encode(), 0x00000000);
    }

    #[test]
    fn test_halt_encoding() {
        let instr = Instruction {
            opcode: Opcode::Halt,
            stratum: 0,
            p1: 0,
            p2: 0,
        };
        assert_eq!(instr.encode(), 0x0000000D);
    }

    #[test]
    fn test_ldi_encoding() {
        let instr = Instruction {
            opcode: Opcode::Ldi,
            stratum: 0,
            p1: 5,
            p2: 0,
        };
        assert_eq!(instr.encode(), 0x00050001);
    }

    #[test]
    fn test_assemble_simple() {
        let mut asm = GlyphAssembler::new();
        let program = asm
            .assemble(
                r#"
            LDI r0, 42
            LDI r1, 100
            STORE mem[r1], r0
            HALT
        "#,
            )
            .unwrap();

        assert_eq!(program.len(), 6);
        assert_eq!(program.words[0], 0x00000001); // LDI r0
        assert_eq!(program.words[1], 42); // DATA: 42
        assert_eq!(program.words[4], 0x00010004); // STORE mem[r1], r0
        assert_eq!(program.words[5], 0x0000000D); // HALT
    }

    #[test]
    fn test_assemble_with_label() {
        let mut asm = GlyphAssembler::new();
        let program = asm
            .assemble(
                r#"
        start:
            LDI r0, 0
            LDI r1, 1
            ADD r0, r0, r1
            BNE r1, r0, start
            HALT
        "#,
            )
            .unwrap();

        assert!(program.labels.contains_key("start"));
        assert_eq!(program.labels["start"], 0);
    }

    #[test]
    fn test_assemble_self_replication() {
        let mut asm = GlyphAssembler::new();
        let program = asm
            .assemble(
                r#"
            // Self-replicating glyph
            LDI r0, 0           // src = 0
            LDI r1, 100         // dst = 100
            LDI r2, 0           // counter = 0
            LDI r3, 1           // increment = 1
            LDI r4, 18          // length = 18
        loop:
            LOAD r5, [r0]       // r5 = mem[r0]
            STORE [r1], r5      // mem[r1] = r5
            ADD r0, r3, r0      // src++
            ADD r1, r3, r1      // dst++
            ADD r2, r3, r2      // counter++
            BNE r2, r4, loop    // if counter != length, loop
            HALT
        "#,
            )
            .unwrap();

        // 5 LDI (2 words each) + 1 LOAD + 1 STORE + 3 ADD + 1 BNE (2 words) + 1 HALT = 18 words
        assert_eq!(program.len(), 18);
        assert!(program.labels.contains_key("loop"));
    }

    #[test]
    fn test_sll_encoding() {
        // Test three-operand SLL: SLL rd, rs1, rs2
        // Encodes as: opcode=131, stratum=rs2, p1=rs1, p2=rd
        let mut asm = GlyphAssembler::new();
        let program = asm.assemble("SLL r15, r10, r14").unwrap();

        // SLL r15, r10, r14 means: r15 = r10 << r14
        // Encoding: opcode=131, stratum=14 (r14), p1=10 (r10), p2=15 (r15)
        // Expected: 0x0F0A0E83 = 131 | (14 << 8) | (10 << 16) | (15 << 24)
        let expected = 0x0F0A0E83u32;
        assert_eq!(
            program.words[0], expected,
            "SLL r15, r10, r14 should encode as {:08X}, got {:08X}",
            expected, program.words[0]
        );
    }

    #[test]
    fn test_draw_encoding() {
        // Test DRAW opcode: DRAW r_glyph, r_x, r_y
        // Encodes as: opcode=215, stratum=r_y, p1=r_glyph, p2=r_x
        let mut asm = GlyphAssembler::new();
        let program = asm.assemble("DRAW r23, r20, r21").unwrap();

        // DRAW r23, r20, r21 means: draw glyph from r23 at position (r20, r21)
        // Encoding: opcode=215, stratum=21 (r_y), p1=23 (r_glyph), p2=20 (r_x)
        // Expected: 0x141715D7 = 215 | (21 << 8) | (23 << 16) | (20 << 24)
        let expected = 215u32 | (21u32 << 8) | (23u32 << 16) | (20u32 << 24);
        assert_eq!(
            program.words[0], expected,
            "DRAW r23, r20, r21 should encode as {:08X}, got {:08X}",
            expected, program.words[0]
        );
    }
}
