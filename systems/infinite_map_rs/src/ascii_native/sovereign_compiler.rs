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
use crate::glyph_assembler::{AssembledProgram, GlyphAssembler};

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

    // 5. Embed source text at 0x1000 (state buffer)
    writer.set_source_text(SOURCE_BASE, source);

    // 6. Set boot program (UI event loop)
    let boot_program = assemble_boot_program()?;
    writer.set_program(&boot_program.words);

    // 7. Embed assembler bytecode at 0x2000 (state buffer segment)
    writer.set_segment(ASSEMBLER_BASE, &assembler_program.words);

    // 8. Apply action mapping for buttons
    // Map button actions to boot program labels
    let action_map: HashMap<&str, (&str, &str)> = [
        ("Assemble", ("JUMP", "do_assemble")), // Jump to assemble handler
        ("Run", ("JUMP", "do_run")),           // Jump to run handler
        ("Quit", ("JUMP", "do_quit")),         // Jump to quit handler
    ]
    .iter()
    .cloned()
    .collect();

    writer.apply_action_mapping(&action_map, &boot_program.labels);

    // 9. Generate PNG
    let png_bytes = writer.to_png()?;

    // 8. Write to file
    let mut file = File::create(output_path.as_ref())
        .map_err(|e| format!("Failed to create output file: {}", e))?;
    file.write_all(&png_bytes)
        .map_err(|e| format!("Failed to write PNG data: {}", e))?;

    Ok(())
}

/// Assemble the boot program that handles UI and dispatches to assembler
///
/// The boot program:
/// 1. Initializes state
/// 2. Runs event loop checking for button presses
/// 3. Dispatches to assembler on [B] Assemble
/// 4. Dispatches to run compiled program on [R] Run
fn assemble_boot_program() -> Result<AssembledProgram, String> {
    let boot_source = r#"
        :entry
        LDI r0, 0          ; Zero register
        LDI r1, 0x7000     ; State base
        STORE mem[r1], r0  ; frame = 0
        JMP :main_loop

        :main_loop
        ; Check for input events at 0x0200
        LDI r1, 0x0200
        LOAD r2, mem[r1]
        LD r3, 0
        BEQ r2, r3, :update_frame

        ; Event detected - check event type
        ; 1 = Assemble (B button), 2 = Run (R button), 3 = Quit (Q button)
        LDI r3, 1
        BEQ r2, r3, :do_assemble
        LDI r3, 2
        BEQ r2, r3, :do_run
        LDI r3, 3
        BEQ r2, r3, :do_quit

        ; Unknown event - just clear and continue
        JMP :clear_event

        :do_assemble
        LDI r0, 0x2000
        JMP r0

        :do_run
        LDI r0, 0x5000
        JMP r0

        :do_quit
        HALT

        :clear_event
        LDI r0, 0
        LDI r1, 0x0200
        STORE mem[r1], r0

        :update_frame
        LDI r1, 0x7000
        LOAD r2, mem[r1]
        LDI r3, 1
        ADD r2, r2, r3
        STORE mem[r1], r2
        JMP :main_loop
    "#;

    let mut asm = GlyphAssembler::new();
    let program = asm.assemble(boot_source)?;
    Ok(program)
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
        assert!(
            SOURCE_BASE < ASSEMBLER_BASE,
            "Source should be before assembler"
        );
        assert!(
            ASSEMBLER_BASE < OUTPUT_BASE,
            "Assembler should be before output"
        );
        assert!(
            OUTPUT_BASE < LABEL_TABLE_BASE,
            "Output should be before label table"
        );
        assert!(
            LABEL_TABLE_BASE < STATE_BASE,
            "Label table should be before state"
        );
    }

    #[test]
    fn test_assembler_source_embeds() {
        // Verify the assembler source is embedded
        assert!(
            !ASSEMBLER_SOURCE.is_empty(),
            "Assembler source should be embedded"
        );
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
        assert!(
            !program.words.is_empty(),
            "Assembler should produce bytecode"
        );
        assert!(
            program.labels.contains_key("main"),
            "Assembler should have main label"
        );
    }
}
