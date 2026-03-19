//! Glyph to Cartridge Compiler
//!
//! Compiles .glyph source directly to .rts.png cartridge.
//! This is the self-hosting bootstrap - eliminates Python dependency.

use std::collections::HashMap;
use std::path::Path;

use crate::cartridge_writer::{CartridgeConfig, CartridgeWriter};
use crate::glyph_assembler::GlyphAssembler;

/// Compile .glyph source to .rts.png cartridge
pub fn compile_glyph_to_cartridge<P: AsRef<Path>>(
    source: &str,
    output_path: P,
) -> Result<(), String> {
    // 1. Assemble the program
    let mut asm = GlyphAssembler::new();
    let program = asm.assemble(source)?;

    // 2. Extract display text (lines starting with | or containing button patterns)
    let display_text = extract_display_text(source);

    // 3. Create cartridge
    let config = CartridgeConfig {
        name: "glyph_program".to_string(),
        version: 1,
    };
    let mut writer = CartridgeWriter::new(config);

    // 4. Load display text
    writer.load_glyph_text(&display_text);

    // 5. Set program bytecode
    writer.set_program(&program.words);

    // 6. Detect patterns and apply default mapping
    let action_map = default_action_mapping();
    writer.apply_action_mapping(&action_map, &program.labels);

    // 7. Generate PNG
    let png_data = writer.to_png()?;

    // 8. Write to file
    std::fs::write(output_path, &png_data).map_err(|e| format!("Failed to write output: {}", e))?;

    Ok(())
}

/// Extract display text from source (ASCII box content)
fn extract_display_text(source: &str) -> String {
    let mut lines = Vec::new();

    for line in source.lines() {
        // Include lines that look like display content
        if line.contains('|') || line.contains('+') || line.contains('-') {
            let cleaned = line
                .replace('|', " ")
                .replace('+', "+")
                .replace('-', "-");
            lines.push(cleaned);
        } else if !line.trim().starts_with(';')
            && !line.trim().starts_with(':')
            && !line.trim().starts_with("//")
        {
            // Include non-instruction lines (for button patterns)
            if !line.trim().is_empty() && !is_instruction(line) {
                lines.push(line.to_string());
            }
        }
    }

    lines.join("\n")
}

fn is_instruction(line: &str) -> bool {
    let opcodes = [
        "LDI", "MOV", "LOAD", "STORE", "ADD", "SUB", "MUL", "DIV", "JMP", "JUMP", "BNE", "BEQ",
        "BLT", "BGE", "CALL", "RET", "HALT", "EXIT", "AND", "OR", "XOR", "SLL", "SRL", "DRAW",
        "NOP", "LD", "ST", "BRANCH",
    ];
    opcodes
        .iter()
        .any(|op| line.to_uppercase().trim().starts_with(op))
}

fn default_action_mapping() -> HashMap<&'static str, (&'static str, &'static str)> {
    let mut map = HashMap::new();
    map.insert("run", ("JUMP", "main"));
    map.insert("Run", ("JUMP", "main"));
    map.insert("RUN", ("JUMP", "main"));
    map.insert("start", ("JUMP", "start"));
    map.insert("Start", ("JUMP", "start"));
    map.insert("quit", ("EXIT", ""));
    map.insert("Quit", ("EXIT", ""));
    map.insert("exit", ("EXIT", ""));
    map.insert("Exit", ("EXIT", ""));
    map.insert("back", ("JUMP", "menu"));
    map.insert("Back", ("JUMP", "menu"));
    map.insert("next", ("JUMP", "next"));
    map.insert("Next", ("JUMP", "next"));
    map.insert("prev", ("JUMP", "prev"));
    map.insert("Prev", ("JUMP", "prev"));
    map
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_is_instruction() {
        assert!(is_instruction("LDI r0, 42"));
        assert!(is_instruction("  LDI r0, 42"));
        assert!(is_instruction("halt"));
        assert!(is_instruction("JUMP :label"));
        assert!(!is_instruction("; comment"));
        assert!(!is_instruction("[R] Run"));
        assert!(!is_instruction(""));
    }

    #[test]
    fn test_extract_display_text() {
        let source = r#"
; Comment line
[R] Run
[Q] Quit
:main
LDI r0, 42
HALT
"#;
        let display = extract_display_text(source);
        assert!(display.contains("[R] Run"));
        assert!(display.contains("[Q] Quit"));
        assert!(!display.contains("LDI"));
        assert!(!display.contains("HALT"));
    }

    #[test]
    fn test_default_action_mapping() {
        let map = default_action_mapping();
        assert!(map.contains_key("run"));
        assert!(map.contains_key("Run"));
        assert_eq!(map.get("run"), Some(&("JUMP", "main")));
        assert_eq!(map.get("quit"), Some(&("EXIT", "")));
    }
}
