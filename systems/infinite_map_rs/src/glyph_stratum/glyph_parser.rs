//! systems/glyph_stratum/glyph_parser.rs
//!
//! A simple parser for the .glyph assembly-like format.
//! Converts human-readable glyph programs into a raw u32 buffer
//! that can be uploaded to the GPU.

use std::collections::HashMap;

/// VM configuration parsed from .glyph file
#[derive(Debug, Clone, Copy, Default)]
pub struct VmConfig {
    pub entry_point: u32,
    pub parent_id: u32,
    pub base_addr: u32,
    pub bound_addr: u32,
    pub initial_regs: [u32; 32],
}

// Opcodes (must match shader)
const OP_NOP: u32 = 0;
#[allow(dead_code)] // Scaffolding: memory management opcodes for future GPU allocator
const OP_ALLOC: u32 = 1;
#[allow(dead_code)] // Scaffolding: memory management opcodes for future GPU allocator
const OP_FREE: u32 = 2;
const OP_LOAD: u32 = 3;
const OP_STORE: u32 = 4;
const OP_ADD: u32 = 5;
const OP_SUB: u32 = 6;
const OP_MUL: u32 = 7;
const OP_DIV: u32 = 8;
const OP_JMP: u32 = 9;
const OP_BRANCH: u32 = 10;
const OP_CALL: u32 = 11;
const OP_RETURN: u32 = 12;
const OP_HALT: u32 = 13;
#[allow(dead_code)] // Scaffolding: inline data embedding for future use
const OP_DATA: u32 = 14;
#[allow(dead_code)] // Scaffolding: structured loops for future use
const OP_LOOP: u32 = 15;

// AI-Native / Substrate Opcodes
#[allow(dead_code)] // Scaffolding: spatial spawning for AI agents
const OP_SPATIAL_SPAWN: u32 = 225;
#[allow(dead_code)] // Scaffolding: self-modifying code support
const OP_GLYPH_MUTATE: u32 = 226;
const OP_YIELD: u32 = 227;

// Spatial / Infinite Map Opcodes
const OP_CAMERA: u32 = 230;
#[allow(dead_code)] // Scaffolding: Hilbert curve coordinate conversion
const OP_HILBERT_D2XY: u32 = 231;
#[allow(dead_code)] // Scaffolding: Hilbert curve coordinate conversion
const OP_HILBERT_XY2D: u32 = 232;
#[allow(dead_code)] // Scaffolding: infinite map tile management
const OP_TILE_LOAD: u32 = 233;
#[allow(dead_code)] // Scaffolding: infinite map tile management
const OP_TILE_EVICT: u32 = 234;
#[allow(dead_code)] // Scaffolding: camera zoom control
const OP_ZOOM: u32 = 235;
#[allow(dead_code)] // Scaffolding: camera pan control
const OP_PAN: u32 = 236;

/// Parses a .glyph file into a raw program buffer
pub fn parse_glyph_program(source: &str) -> Result<(Vec<u32>, VmConfig), String> {
    let mut labels = HashMap::new();
    let mut program = Vec::new();
    let mut equs = HashMap::new();
    let mut pc = 0u32;

    // First pass: Collect labels and .equ constants
    for line in source.lines() {
        // Strip both // and ; style comments
        let without_slash_comment = line.split("//").next().unwrap_or("");
        let trimmed = without_slash_comment.split(';').next().unwrap_or("").trim();
        if trimmed.is_empty() {
            continue;
        }

        if trimmed.starts_with(':') {
            labels.insert(trimmed[1..].to_string(), pc);
        } else if trimmed.starts_with(".equ") {
            let parts: Vec<_> = trimmed.split_whitespace().collect();
            if parts.len() == 3 {
                let name = parts[1].to_string();
                let value = parts[2]
                    .parse::<u32>()
                    .unwrap_or_else(|_| u32::from_str_radix(&parts[2][2..], 16).unwrap_or(0));
                equs.insert(name, value);
            }
        } else {
            pc += 4; // Each glyph is 4 u32s (RGBA)
        }
    }

    pc = 0;

    // Second pass: Assemble the program
    for line in source.lines() {
        // Strip both // and ; style comments
        let without_slash_comment = line.split("//").next().unwrap_or("");
        let trimmed = without_slash_comment.split(';').next().unwrap_or("").trim();
        if trimmed.is_empty() || trimmed.starts_with(':') || trimmed.starts_with(".equ") {
            continue;
        }

        let parts: Vec<_> = trimmed
            .split_whitespace()
            .map(|s| s.trim_end_matches(','))
            .collect();
        let mnemonic = parts[0].to_uppercase();

        let (opcode, p1, p2, stratum) = match mnemonic.as_str() {
            "MOV" => (OP_ADD, resolve_operand(parts[1], &equs, &labels), 0, 2),
            "ADD" => (
                OP_ADD,
                resolve_operand(parts[1], &equs, &labels),
                resolve_operand(parts[2], &equs, &labels),
                2,
            ),
            "SUB" => (
                OP_SUB,
                resolve_operand(parts[1], &equs, &labels),
                resolve_operand(parts[2], &equs, &labels),
                2,
            ),
            "MUL" => (
                OP_MUL,
                resolve_operand(parts[1], &equs, &labels),
                resolve_operand(parts[2], &equs, &labels),
                2,
            ),
            "DIV" => (
                OP_DIV,
                resolve_operand(parts[1], &equs, &labels),
                resolve_operand(parts[2], &equs, &labels),
                2,
            ),
            "LOAD" => (
                OP_LOAD,
                resolve_operand(parts[2], &equs, &labels),
                resolve_operand(parts[1], &equs, &labels),
                2,
            ),
            "STORE" => (
                OP_STORE,
                resolve_operand(parts[1], &equs, &labels),
                resolve_operand(parts[2], &equs, &labels),
                2,
            ),
            "JMP" => (OP_JMP, resolve_operand(parts[1], &equs, &labels), 0, 2),
            "CALL" => (OP_CALL, resolve_operand(parts[1], &equs, &labels), 0, 2),
            "RET" => (OP_RETURN, 0, 0, 2),
            "HALT" => (OP_HALT, 0, 0, 2),
            "YIELD" => (OP_YIELD, 0, 0, 2),
            "CAMERA" => (
                OP_CAMERA,
                resolve_operand(parts[1], &equs, &labels),
                resolve_operand(parts[2], &equs, &labels),
                2,
            ),
            "CMP" => (
                OP_SUB,
                resolve_operand(parts[1], &equs, &labels),
                resolve_operand(parts[2], &equs, &labels),
                2,
            ), // Simulate with SUB
            "JE" => (OP_BRANCH, resolve_operand(parts[1], &equs, &labels), 0, 2), // Simplified Branch if Zero
            "JNE" => (OP_BRANCH, resolve_operand(parts[1], &equs, &labels), 1, 2), // Simplified Branch if Not Zero
            "JLT" => (OP_BRANCH, resolve_operand(parts[1], &equs, &labels), 2, 2), // Simplified Branch if Less Than
            "JGT" => (OP_BRANCH, resolve_operand(parts[1], &equs, &labels), 3, 2), // Simplified Branch if Greater Than
            _ => (OP_NOP, 0, 0, 0),
        };

        // Only add 200 for opcodes < 200 (core opcodes)
        // AI-native opcodes (225-236) are already in the correct range
        let normalized_opcode = if opcode < 200 { opcode + 200 } else { opcode };
        program.push(normalized_opcode);
        program.push(stratum);
        program.push(p1);
        program.push(p2);

        pc += 4;
    }

    let entry_point = labels.get("entry").cloned().unwrap_or(0);
    let vm_config = VmConfig {
        entry_point,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0; 32],
    };

    Ok((program, vm_config))
}

fn resolve_operand(op: &str, equs: &HashMap<String, u32>, labels: &HashMap<String, u32>) -> u32 {
    if op.starts_with("r[") {
        let reg_name = &op[2..op.len() - 1];
        if let Ok(num) = reg_name.parse::<u32>() {
            num
        } else {
            equs.get(reg_name).cloned().unwrap_or(0)
        }
    } else if let Ok(num) = op.parse::<u32>() {
        num
    } else if op.starts_with("0x") {
        u32::from_str_radix(&op[2..], 16).unwrap_or(0)
    } else {
        labels.get(op).cloned().unwrap_or(0)
    }
}
