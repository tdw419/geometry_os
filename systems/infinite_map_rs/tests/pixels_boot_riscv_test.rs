//! Pixels Move Pixels to Boot RISC-V
//!
//! THE BRIDGE TEST.
//!
//! This test proves that the glyph VM (pixels move pixels) can serve as
//! a bootloader for the RISC-V VM. The flow:
//!
//! 1. RISC-V instructions are stored in the glyph atlas (RAM texture)
//! 2. A glyph program copies them to a "boot region" on the texture
//! 3. The boot region is read back from the GPU
//! 4. Those bytes are loaded into the RISC-V VM's memory
//! 5. The RISC-V VM executes them
//! 6. UART output appears: "Hi\n"
//!
//! The glyph VM is the bootloader. The RISC-V VM is the CPU.
//! Pixels moved pixels to produce computation on a real ISA.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

    /// Encode a glyph instruction
    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    /// RISC-V instruction encoders
    mod rv32 {
        /// LUI rd, imm20 — Load Upper Immediate
        pub fn lui(rd: u32, imm20: u32) -> u32 {
            (imm20 << 12) | (rd << 7) | 0x37
        }

        /// ADDI rd, rs1, imm12 — Add Immediate
        pub fn addi(rd: u32, rs1: u32, imm12: i32) -> u32 {
            let imm = (imm12 as u32) & 0xFFF;
            (imm << 20) | (rs1 << 15) | (0 << 12) | (rd << 7) | 0x13
        }

        /// SW rs2, offset(rs1) — Store Word
        pub fn sw(rs2: u32, rs1: u32, offset: i32) -> u32 {
            let imm = (offset as u32) & 0xFFF;
            let imm_11_5 = (imm >> 5) & 0x7F;
            let imm_4_0 = imm & 0x1F;
            (imm_11_5 << 25) | (rs2 << 20) | (rs1 << 15) | (2 << 12) | (imm_4_0 << 7) | 0x23
        }

        /// EBREAK — halt
        pub fn ebreak() -> u32 {
            0x00100073
        }
    }

    /// A minimal RISC-V program that writes "Hi\n" to the UART (0x10000000)
    /// then halts with EBREAK.
    ///
    /// This is 8 instructions = 8 pixels = 32 bytes.
    fn riscv_hello_program() -> Vec<u32> {
        let uart_base: u32 = 0x10000; // upper 20 bits for LUI (0x10000000 >> 12)
        let x1: u32 = 1;  // temp register for UART address
        let a0: u32 = 10; // temp register for character

        vec![
            rv32::lui(x1, uart_base),       // x1 = 0x10000000 (UART base)
            rv32::addi(a0, 0, 72),          // a0 = 'H' (72)
            rv32::sw(a0, x1, 0),            // UART[0] = 'H'
            rv32::addi(a0, 0, 105),         // a0 = 'i' (105)
            rv32::sw(a0, x1, 0),            // UART[0] = 'i'
            rv32::addi(a0, 0, 10),          // a0 = '\n' (10)
            rv32::sw(a0, x1, 0),            // UART[0] = '\n'
            rv32::ebreak(),                 // halt
        ]
    }

    fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            dx12_shader_compiler: wgpu::Dx12Compiler::default(),
            ..Default::default()
        });

        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::default(),
            compatible_surface: None,
            force_fallback_adapter: false,
        }))?;

        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Pixels Boot RISC-V Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    /// The glyph copy-loop program: copies `count` pixels from `src` to `dst`.
    fn copy_program(src: u32, dst: u32, count: u32) -> Vec<(u32, u32)> {
        vec![
            (0, glyph(1, 0, 0, 0)),      // LDI r0
            (1, src),                      // DATA: source
            (2, glyph(1, 0, 1, 0)),      // LDI r1
            (3, dst),                      // DATA: destination
            (4, glyph(1, 0, 2, 0)),      // LDI r2
            (5, 0u32),                     // DATA: counter = 0
            (6, glyph(1, 0, 3, 0)),      // LDI r3
            (7, 1u32),                     // DATA: increment = 1
            (8, glyph(1, 0, 4, 0)),      // LDI r4
            (9, count),                    // DATA: count
            (10, glyph(3, 0, 0, 5)),     // LOAD r5 = mem[r0]
            (11, glyph(4, 0, 1, 5)),     // STORE mem[r1] = r5
            (12, glyph(5, 0, 3, 0)),     // ADD r0 += r3
            (13, glyph(5, 0, 3, 1)),     // ADD r1 += r3
            (14, glyph(5, 0, 3, 2)),     // ADD r2 += r3
            (15, glyph(10, 1, 2, 4)),    // BRANCH BNE r2, r4
            (16, (-7i32) as u32),          // DATA: offset
            (17, glyph(13, 0, 0, 0)),    // HALT
        ]
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_pixels_boot_riscv() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        println!("\n============================================================");
        println!("  PIXELS MOVE PIXELS TO BOOT RISC-V");
        println!("============================================================\n");

        // ================================================================
        // PHASE 1: GLYPH VM — pixels move RISC-V instructions
        // ================================================================

        println!("--- Phase 1: Glyph VM (pixels move pixels) ---\n");

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler =
            GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Boot RAM"),
            size: wgpu::Extent3d {
                width: 4096,
                height: 4096,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING
                | wgpu::TextureUsages::COPY_DST
                | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));

        scheduler.set_ram_texture(ram_texture);

        // --- Store RISC-V instructions in the atlas ---
        let riscv_program = riscv_hello_program();
        let atlas_base: u32 = 50000;
        let boot_region: u32 = 1000;

        println!("  Storing RISC-V program in atlas (addr {}):", atlas_base);
        for (i, &instr) in riscv_program.iter().enumerate() {
            scheduler.poke_substrate_single(atlas_base + i as u32, instr);
            println!("    atlas[{}]: 0x{:08X}  (RISC-V instruction)", atlas_base + i as u32, instr);
        }

        // --- Write the glyph copy program ---
        let program = copy_program(atlas_base, boot_region, riscv_program.len() as u32);
        println!("\n  Writing glyph bootloader ({} pixels)...", program.len());
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
        }

        // --- Execute the glyph VM ---
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn glyph VM");
        println!("  Glyph VM spawned. Executing...");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // --- Verify: RISC-V instructions were copied by the glyph VM ---
        println!("\n  Verifying glyph VM copied RISC-V instructions:\n");
        let mut all_copied = true;
        for (i, &expected) in riscv_program.iter().enumerate() {
            let actual = scheduler.peek_substrate_single(boot_region + i as u32);
            let status = if actual == expected { "✓" } else { "✗" };
            println!(
                "    {} boot[{}]: expected 0x{:08X}, got 0x{:08X}",
                status,
                boot_region + i as u32,
                expected,
                actual
            );
            if actual != expected {
                all_copied = false;
            }
        }
        assert!(all_copied, "Glyph VM failed to copy RISC-V instructions");
        println!("\n  ✓ Glyph VM successfully moved RISC-V instructions");

        // --- Extract the copied bytes for the RISC-V VM ---
        let mut riscv_bytes: Vec<u8> = Vec::new();
        for i in 0..riscv_program.len() {
            let word = scheduler.peek_substrate_single(boot_region + i as u32);
            riscv_bytes.extend_from_slice(&word.to_le_bytes());
        }

        // ================================================================
        // PHASE 2: RISC-V VM — execute the instructions pixels moved
        // ================================================================

        println!("\n--- Phase 2: RISC-V VM (execute what pixels moved) ---\n");

        use infinite_map_rs::riscv_linux_vm::RiscVLinuxVM;

        let mut riscv_vm = RiscVLinuxVM::new(device.clone(), queue.clone(), 64 * 1024 * 1024);

        // Initialize the VM (runs the init shader)
        riscv_vm.initialize();

        // Load the program that pixels moved
        println!("  Loading {} bytes into RISC-V memory at 0x80000000...", riscv_bytes.len());
        riscv_vm.load_kernel(&riscv_bytes);

        // Execute
        println!("  Executing RISC-V VM (10000 instructions budget)...");
        riscv_vm.step(); // Each step runs 10000 instructions

        // Read stats to get UART output
        let stats = riscv_vm.read_stats();
        let char_count = stats[0] as usize;
        let state = riscv_vm.read_state();
        let pc = riscv_vm.read_pc();

        println!("\n  RISC-V VM state:");
        println!("    PC:           0x{:08X}", pc);
        println!("    Running:      {}", state.running);
        println!("    Instructions: {}", state.instruction_count);
        println!("    UART chars:   {}", char_count);

        // ================================================================
        // PHASE 3: THE MOMENT OF TRUTH — read UART output
        // ================================================================

        println!("\n--- Phase 3: Did pixels produce computation? ---\n");

        let mut output = String::new();
        if char_count > 0 && char_count < 60 {
            for i in 0..char_count {
                let ch = (stats[1 + i] & 0xFF) as u8;
                output.push(ch as char);
            }
        }

        println!("  UART output: {:?}", output);

        let expected = "Hi\n";
        if output == expected {
            println!();
            println!("  ╔════════════════════════════════════════════════════════╗");
            println!("  ║  PIXELS BOOTED RISC-V.                               ║");
            println!("  ║                                                       ║");
            println!("  ║  The glyph VM moved 8 RISC-V instructions.            ║");
            println!("  ║  The RISC-V VM executed them.                         ║");
            println!("  ║  UART output: \"Hi\"                                    ║");
            println!("  ║                                                       ║");
            println!("  ║  Pixels moved pixels to produce real computation.     ║");
            println!("  ╚════════════════════════════════════════════════════════╝");
        } else {
            println!();
            println!("  Output mismatch: expected {:?}, got {:?}", expected, output);
            println!("  Stats dump: {:?}", &stats[..std::cmp::min(16, stats.len())]);
        }
        println!();

        assert_eq!(output, expected, "RISC-V did not produce expected UART output");
    }
}
