//! Sovereign Synthetic VRAM Integration Tests
//!
//! Tests that verify the self-hosting assembler works on SyntheticVram (CPU-side GPU emulation).
//! These tests prove that the assembler can:
//! 1. Compile simple programs from text
//! 2. Handle labels and jumps
//! 3. Self-compile (the ultimate sovereignty test)
//!
//! Memory Layout:
//! - 0x1000: Source text input (null-terminated)
//! - 0x2000: Self-hosting assembler binary
//! - 0x5000: Compiled bytecode output
//! - 0x6000: Label table

#[cfg(test)]
mod tests {
    use infinite_map_rs::synthetic_vram::{SyntheticVram, SyntheticVmConfig};
    use infinite_map_rs::glyph_assembler::GlyphAssembler;

    /// Load and run the self-hosting assembler on synthetic VRAM
    ///
    /// # Arguments
    /// * `source` - ASCII assembly source to compile
    /// * `max_cycles` - Maximum cycles to run before timeout
    ///
    /// # Returns
    /// Compiled bytecode from 0x5000
    fn run_assembler_on_synthetic(source: &str, max_cycles: u32) -> Result<Vec<u32>, String> {
        // 1. Create synthetic VRAM (256x256 = 64K address space)
        let mut vram = SyntheticVram::new_small(256);

        // 2. Compile and load the self-hosting assembler at 0x0000
        //    (The assembler expects to be at address 0)
        let assembler_source =
            include_str!("../../../systems/glyph_stratum/programs/self_hosting_assembler.glyph");
        let mut asm = GlyphAssembler::new();
        let program = asm.assemble(assembler_source)?;

        // Get entry point (:main label)
        let main_addr = asm.get_label_addr("main").unwrap_or(0);

        // Load assembler binary at 0x0000
        for (i, word) in program.words.iter().enumerate() {
            vram.poke(i as u32, *word);
        }

        // 3. Load source at 0x1000
        for (i, byte) in source.bytes().enumerate() {
            vram.poke(0x1000 + i as u32, byte as u32);
        }
        // Null terminate
        vram.poke(0x1000 + source.len() as u32, 0);

        // 4. Spawn VM at entry point (main_addr since binary is at 0x0000)
        vram.spawn_vm(
            0,
            &SyntheticVmConfig {
                entry_point: main_addr,
                ..SyntheticVmConfig::default()
            },
        )?;

        // 5. Run until halt (with cycle limit)
        let mut total_cycles = 0u32;
        let cycles_per_step = 100u32;

        while total_cycles < max_cycles {
            vram.execute_frame_interleaved(cycles_per_step);
            total_cycles += cycles_per_step;

            if vram.is_halted(0) {
                break;
            }
        }

        if !vram.is_halted(0) {
            return Err(format!("VM did not halt within {} cycles", max_cycles));
        }

        // 6. Read output from 0x5000
        let mut output = Vec::new();
        for i in 0..256 {
            let word = vram.peek(0x5000 + i);
            if word == 0 {
                break;
            }
            output.push(word);
        }

        Ok(output)
    }

    #[test]
    fn test_synthetic_assemble_simple() {
        // The self-hosting assembler expects @ prefix on instructions to compile
        let source = "@LDI r0, 42\n@HALT\n";
        let result = run_assembler_on_synthetic(source, 100_000);

        // Should produce bytecode
        assert!(result.is_ok(), "Assembly failed: {:?}", result);
        let bytecode = result.unwrap();
        assert!(!bytecode.is_empty(), "Should produce some bytecode");

        // LDI r0, 42 produces: opcode=1, p1=0 (r0), then immediate=42
        // HALT produces: opcode=13
        // Expected: [0x00010000, 42, 13] (3 words)
        assert!(
            bytecode.len() >= 2,
            "Should produce at least 2 words (LDI immediate + HALT), got {:?}",
            bytecode
        );

        // Verify LDI opcode: opcode 1, register 0 in p1 field (bits 16-23)
        // LDI format: [opcode:8][stratum:8][p1:8][p2:8] followed by immediate value
        let ldi_word = bytecode[0];
        let opcode = ldi_word & 0xFF;
        assert_eq!(
            opcode, 1,
            "First word should be LDI (opcode 1), got opcode {}",
            opcode
        );

        // Verify the immediate value
        assert!(bytecode.len() >= 2, "LDI should have immediate value word");
        let immediate = bytecode[1];
        assert_eq!(
            immediate, 42,
            "Immediate value should be 42, got {}",
            immediate
        );

        // Verify HALT opcode
        assert!(bytecode.len() >= 3, "Should have HALT after LDI immediate");
        let halt_word = bytecode[2];
        let halt_opcode = halt_word & 0xFF;
        assert_eq!(
            halt_opcode, 13,
            "Third word should be HALT (opcode 13), got opcode {}",
            halt_opcode
        );
    }

    #[test]
    fn test_synthetic_assemble_with_label() {
        let source = ":loop\nLDI r0, 1\nJMP :loop\n";
        let result = run_assembler_on_synthetic(source, 100_000);

        assert!(result.is_ok(), "Assembly failed: {:?}", result);
        let bytecode = result.unwrap();
        assert!(bytecode.len() >= 3, "Should produce at least 3 words");

        // :loop is at offset 0
        // LDI r0, 1 at offset 2 (word 0 = LDI, word 1 = immediate 1)
        // JMP :loop at offset 4 (word 2 = JMP with relative offset)
        // Expected: [LDI opcode, 1, JMP opcode, offset]
        assert!(
            bytecode.len() >= 4,
            "Should have LDI immediate and JMP offset words"
        );

        // Verify LDI
        let ldi_opcode = bytecode[0] & 0xFF;
        assert_eq!(ldi_opcode, 1, "First word should be LDI");

        // Verify immediate
        let immediate = bytecode[1];
        assert_eq!(immediate, 1, "Immediate should be 1");

        // Verify JMP (opcode 9)
        let jmp_opcode = bytecode[2] & 0xFF;
        assert_eq!(jmp_opcode, 9, "Should have JMP (opcode 9)");
    }

    #[test]
    fn test_synthetic_assemble_add_store() {
        let source = "LDI r0, 100\nLDI r1, 200\nADD r0, r1\nLDI r2, 0x5000\nSTORE r2, r0\nHALT\n";
        let result = run_assembler_on_synthetic(source, 100_000);

        assert!(result.is_ok(), "Assembly failed: {:?}", result);
        let bytecode = result.unwrap();

        // Should produce: LDI, LDI, ADD, LDI, STORE, HALT
        // LDI(2 words) + LDI(2 words) + ADD(1 word) + LDI(2 words) + STORE(1 word) + HALT(1 word) = 9 words
        assert!(
            bytecode.len() >= 6,
            "Should produce at least 6 words, got {}",
            bytecode.len()
        );

        // Check first LDI
        let first_opcode = bytecode[0] & 0xFF;
        assert_eq!(first_opcode, 1, "First instruction should be LDI");

        // Check ADD instruction (opcode 5)
        // LDI r0, 100 = words 0, 1
        // LDI r1, 200 = words 2, 3
        // ADD r0, r1 = word 4
        let add_word = bytecode[4];
        let add_opcode = add_word & 0xFF;
        assert_eq!(add_opcode, 5, "Should find ADD (opcode 5) at position 4");
    }

    /// The ultimate sovereignty test: assembler compiles itself
    /// This test may take a long time, should be run with care
    #[test]
    #[ignore = "Self-compilation takes ~46500 cycles on synthetic VRAM"]
    fn test_synthetic_self_compile() {
        // The ultimate test: assembler compiles itself
        let assembler_source =
            include_str!("../../../systems/glyph_stratum/programs/self_hosting_assembler.glyph");

        // This needs more cycles for self-compilation
        let result = run_assembler_on_synthetic(assembler_source, 500_000);

        assert!(result.is_ok(), "Self-compilation failed: {:?}", result);
        // Output should be similar to what Rust assembler produces
        let bytecode = result.unwrap();
        assert!(
            bytecode.len() > 100,
            "Self-compilation should produce substantial bytecode (got {} words)",
            bytecode.len()
        );
    }
}
