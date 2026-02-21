//! Geometric Interpreter for PixelRTS v2
//!
//! Interprets "Geometric Programming" instructions directly from pixels.
//! In Geometry OS, the screen is the hard drive, and pixels are the instructions.

use glam::Vec2;

/// Geometric Opcode (Red channel)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum GeometricOpcode {
    Nop = 0x00,
    Add = 0x33, // Match RISC-V ADD opcode as specified in GEOMETRIC_PROGRAMMING.md
    Sub = 0x34,
    Mul = 0x35,
    Div = 0x36,
    Mov = 0x01,
    Jmp = 0x06,
    Halt = 0x07,
}

impl From<u8> for GeometricOpcode {
    fn from(value: u8) -> Self {
        match value {
            0x33 => GeometricOpcode::Add,
            0x34 => GeometricOpcode::Sub,
            0x35 => GeometricOpcode::Mul,
            0x36 => GeometricOpcode::Div,
            0x01 => GeometricOpcode::Mov,
            0x06 => GeometricOpcode::Jmp,
            0x07 => GeometricOpcode::Halt,
            _ => GeometricOpcode::Nop,
        }
    }
}

/// Geometric Instruction (RGBA pixel)
///
/// Red: Opcode
/// Green: Source 1 / Register A
/// Blue: Source 2 / Register B
/// Alpha: Destination / Register C
#[derive(Debug, Clone, Copy)]
pub struct GeometricInstruction {
    pub opcode: GeometricOpcode,
    pub rs1: u8,
    pub rs2: u8,
    pub rd: u8,
}

impl From<[u8; 4]> for GeometricInstruction {
    fn from(pixel: [u8; 4]) -> Self {
        Self {
            opcode: GeometricOpcode::from(pixel[0]),
            rs1: pixel[1],
            rs2: pixel[2],
            rd: pixel[3],
        }
    }
}

/// Geometric Engine
pub struct GeometricEngine {
    pub registers: [u32; 32],
    pub pc: u32,
    pub halted: bool,
}

impl GeometricEngine {
    pub fn new() -> Self {
        Self {
            registers: [0; 32],
            pc: 0,
            halted: false,
        }
    }

    /// Execute a single geometric instruction
    pub fn step(&mut self, instr: GeometricInstruction) {
        if self.halted {
            return;
        }

        match instr.opcode {
            GeometricOpcode::Add => {
                let s1 = self.read_reg(instr.rs1);
                let s2 = self.read_reg(instr.rs2);
                self.write_reg(instr.rd, s1.wrapping_add(s2));
            }
            GeometricOpcode::Sub => {
                let s1 = self.read_reg(instr.rs1);
                let s2 = self.read_reg(instr.rs2);
                self.write_reg(instr.rd, s1.wrapping_sub(s2));
            }
            GeometricOpcode::Mul => {
                let s1 = self.read_reg(instr.rs1);
                let s2 = self.read_reg(instr.rs2);
                self.write_reg(instr.rd, s1.wrapping_mul(s2));
            }
            GeometricOpcode::Div => {
                let s1 = self.read_reg(instr.rs1);
                let s2 = self.read_reg(instr.rs2);
                if s2 != 0 {
                    self.write_reg(instr.rd, s1 / s2);
                } else {
                    self.write_reg(instr.rd, 0xFFFFFFFF);
                }
            }
            GeometricOpcode::Mov => {
                let s1 = self.read_reg(instr.rs1);
                self.write_reg(instr.rd, s1);
            }
            GeometricOpcode::Jmp => {
                self.pc = self.read_reg(instr.rs1);
                return; // PC already updated
            }
            GeometricOpcode::Halt => {
                self.halted = true;
            }
            GeometricOpcode::Nop => {}
        }

        self.pc += 1;
    }

    fn read_reg(&self, reg: u8) -> u32 {
        if reg < 32 {
            self.registers[reg as usize]
        } else {
            reg as u32 // Immediate value if outside register range
        }
    }

    fn write_reg(&mut self, reg: u8, value: u32) {
        if reg < 32 && reg > 0 {
            // x0 is always 0
            self.registers[reg as usize] = value;
        }
    }
}
