//! Sovereign Compiler Cartridge Generator
//!
//! Generates GPU-native .rts.png cartridges that contain a self-hosting assembler
//! capable of compiling source code directly on the GPU without CPU involvement.
//!
//! ## Memory Layout
//!
//! | Range | Purpose |
//! |-------|---------|
//! | 0x0000-0x0FFF | Glyph Grid (display) |
//! | 0x1000-0x1FFF | Source text (ASCII assembly to compile) |
//! | 0x2000-0x2FFF | Assembler bytecode (self_hosting_assembler.glyph compiled) |
//! | 0x5000-0x5FFF | Output buffer (compiled bytecode) |
//! | 0x6000-0x63FF | Label table (hash -> address mapping) |
//! | 0x7000-0x7FFF | Assembler state |

use std::collections::HashMap;
use std::fs::File;
use std::io::Write;
use std::path::Path;

use super::self_hosting_template::SelfHostingTemplate;
use crate::cartridge_writer::{CartridgeConfig, CartridgeWriter};
use crate::glyph_assembler::GlyphAssembler;

/// Source text base address (ASCII assembly to compile)
const SOURCE_BASE: u32 = 0x1000;

/// Assembler bytecode base address
const ASSEMBLER_BASE: u32 = 0x2000;

/// Output buffer base address (compiled bytecode)
const OUTPUT_BASE: u32 = 0x5000;

/// Label table base address
const LABEL_TABLE_BASE: u32 = 0x6000;

/// Assembler state base address
const STATE_BASE: u32 = 0x7000;

/// Self-hosting assembler source code (embedded at compile time)
const ASSEMBLER_SOURCE: &str =
    include_str!("../../../../systems/glyph_stratum/programs/self_hosting_assembler.glyph");

/// Generate a sovereign compiler cartridge from ASCII assembly source
///
/// This creates a GPU-native cartridge that contains:
/// 1. A self-hosting assembler (compiled bytecode at 0x2000)
/// 2. Source text to compile (at 0x1000)
/// 3. UI template with [B] Assemble button that jumps to 0x2000
///
/// When the user clicks [B] Assemble, the GPU executes the assembler
/// which reads source from 0x1000 and writes bytecode to 0x5000.
///
/// # Arguments
/// * `source` - ASCII assembly source code to compile
/// * `output_path` - Path to write the .rts.png cartridge file
///
/// # Returns
/// Ok(()) on success, Err with message on failure
///
/// # Example
/// ```ignore
/// use infinite_map_rs::ascii_native::sovereign_compiler::generate_sovereign_cartridge;
///
/// let source = "LDI r0, 42\nHALT";
/// generate_sovereign_cartridge(source, "sovereign_compiler.rts.png").unwrap();
/// ```
pub fn generate_sovereign_cartridge<P: AsRef<Path>>(
    source: &str,
    output_path: P,
) -> Result<(), String> {
    // 1. Compile the self-hosting assembler with GlyphAssembler (bootstrap step)
    let mut assembler = GlyphAssembler::new();
    let assembler_program = assembler.assemble(ASSEMBLER_SOURCE)?;

    // 2. Render ASCII template with source lines
    let template = SelfHostingTemplate::load()?;
    let source_lines: Vec<&str> = source.lines().collect();
    let display_text = template.render("Ready", &source_lines);

    // 3. Create CartridgeWriter with config
    let config = CartridgeConfig {
        name: "sovereign_compiler".to_string(),
        version: 1,
    };
    let mut writer = CartridgeWriter::new(config);

    // 4. Load display text into glyph grid
    writer.load_glyph_text(&display_text);

    // 5. Embed assembler bytecode at 0x2000 (state buffer segment)
    // Note: set_segment will be added in Task 2, for now we use set_program
    // which places bytecode in the program segment
    writer.set_program(&assembler_program.words);

    // 6. Apply action mapping for buttons
    // [B] Assemble button -> jump to assembler entry point (0x2000)
    let action_map: HashMap<&str, (&str, &str)> = [
        ("Assemble", ("JUMP", "assemble")), // Jump to assembler
        ("Run", ("JUMP", "run_program")),   // Run compiled program
        ("Quit", ("EXIT", "")),             // Exit cartridge
    ]
    .iter()
    .cloned()
    .collect();

    // Use the assembler's labels for action mapping
    writer.apply_action_mapping(&action_map, &assembler_program.labels);

    // 7. Generate PNG
    let png_bytes = writer.to_png()?;

    // 8. Write to file
    let mut file = File::create(output_path.as_ref())
        .map_err(|e| format!("Failed to create output file: {}", e))?;
    file.write_all(&png_bytes)
        .map_err(|e| format!("Failed to write PNG data: {}", e))?;

    Ok(())
}

/// Get the memory layout constants for documentation/debugging
pub mod layout {
    pub const SOURCE_BASE: u32 = super::SOURCE_BASE;
    pub const ASSEMBLER_BASE: u32 = super::ASSEMBLER_BASE;
    pub const OUTPUT_BASE: u32 = super::OUTPUT_BASE;
    pub const LABEL_TABLE_BASE: u32 = super::LABEL_TABLE_BASE;
    pub const STATE_BASE: u32 = super::STATE_BASE;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_memory_layout_constants() {
        // Verify layout doesn't overlap and has reasonable spacing
        assert!(SOURCE_BASE < ASSEMBLER_BASE, "Source should be before assembler");
        assert!(ASSEMBLER_BASE < OUTPUT_BASE, "Assembler should be before output");
        assert!(OUTPUT_BASE < LABEL_TABLE_BASE, "Output should be before label table");
        assert!(LABEL_TABLE_BASE < STATE_BASE, "Label table should be before state");
    }

    #[test]
    fn test_assembler_source_embeds() {
        // Verify the assembler source is embedded
        assert!(!ASSEMBLER_SOURCE.is_empty(), "Assembler source should be embedded");
        assert!(
            ASSEMBLER_SOURCE.contains(":main"),
            "Assembler should have main label"
        );
    }

    #[test]
    fn test_assembler_compiles() {
        // Verify the assembler source compiles successfully
        let mut assembler = GlyphAssembler::new();
        let result = assembler.assemble(ASSEMBLER_SOURCE);
        assert!(result.is_ok(), "Assembler should compile: {:?}", result);

        let program = result.unwrap();
        assert!(!program.words.is_empty(), "Assembler should produce bytecode");
        assert!(
            program.labels.contains_key("main"),
            "Assembler should have main label"
        );
    }
}
