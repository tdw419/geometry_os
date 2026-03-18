//! Linux Boot Simulation Test
//!
//! Demonstrates the "Boot Linux" milestone concept with a minimal program
//! that simulates Linux boot messages. This proves the infrastructure works
//! without requiring a full Linux kernel.
//!
//! Flow:
//! 1. Glyph VM copies "kernel" from atlas to boot region
//! 2. RISC-V VM executes the "kernel"
//! 3. UART shows boot messages: "Linux version...", "/ # " prompt

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

    /// RISC-V instruction encoders (RV32I)
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

    /// Generate a RISC-V program that prints Linux-like boot messages
    fn linux_boot_simulation() -> Vec<u32> {
        // Boot message: "Linux 6.1.0\n/ # "
        let boot_msg: &[u8] = b"Linux 6.1.0\n/ # ";

        let uart_base: u32 = 0x10000; // 0x10000000 >> 12
        let x1: u32 = 1;  // UART address register
        let a0: u32 = 10; // Character register

        let mut program = Vec::new();

        // Set up UART base
        program.push(rv32::lui(x1, uart_base));

        // Print each character
        for &ch in boot_msg {
            program.push(rv32::addi(a0, 0, ch as i32));
            program.push(rv32::sw(a0, x1, 0));
        }

        // Halt
        program.push(rv32::ebreak());

        program
    }

    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::default(),
            compatible_surface: None,
            force_fallback_adapter: false,
        }))?;

        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Linux Boot Simulation Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    /// Glyph copy-loop program
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
    fn test_linux_boot_simulation() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        println!("\n============================================================");
        println!("  LINUX BOOT SIMULATION");
        println!("  (Demonstrates Boot Linux milestone infrastructure)");
        println!("============================================================\n");

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};
        use infinite_map_rs::riscv_linux_vm::RiscVLinuxVM;

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler =
            GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Linux Boot RAM"),
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

        // Store "kernel" in atlas
        let kernel = linux_boot_simulation();
        let atlas_base: u32 = 50000;
        let boot_region: u32 = 0;

        println!("  Kernel: {} instructions ({} bytes)", kernel.len(), kernel.len() * 4);
        println!("  Boot message: \"Linux 6.1.0\\n/ # \"");
        println!("");

        for (i, &instr) in kernel.iter().enumerate() {
            scheduler.poke_substrate_single(atlas_base + i as u32, instr);
        }

        // Write glyph bootloader
        let program = copy_program(atlas_base, boot_region, kernel.len() as u32);
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr + 100, val);
        }

        // Execute glyph VM
        let config = VmConfig {
            entry_point: 100,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        ..Default::default()};
        scheduler.spawn_vm(0, &config).expect("Failed to spawn glyph VM");
        println!("[Glyph VM] Executing bootloader...");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // Verify kernel was copied
        let mut kernel_bytes: Vec<u8> = Vec::new();
        for i in 0..kernel.len() {
            let word = scheduler.peek_substrate_single(boot_region + i as u32);
            kernel_bytes.extend_from_slice(&word.to_le_bytes());
        }
        println!("[Glyph VM] Copied {} bytes to boot region", kernel_bytes.len());

        // Execute RISC-V VM
        println!("\n[RISC-V VM] Booting...");
        let mut riscv_vm = RiscVLinuxVM::new(device.clone(), queue.clone(), 64 * 1024 * 1024);
        riscv_vm.initialize();
        riscv_vm.load_kernel(&kernel_bytes);
        riscv_vm.step();

        // Read stats directly (like pixels_boot_riscv_test does)
        let stats = riscv_vm.read_stats();
        let char_count = stats[0] as usize;
        println!("[RISC-V VM] Stats: char_count={}, first 8: {:08X?}", char_count, &stats[..8]);

        // Build output from stats
        let mut output = String::new();
        if char_count > 0 && char_count < 60 {
            for i in 0..char_count {
                let ch = (stats[1 + i] & 0xFF) as u8;
                output.push(ch as char);
            }
        }

        println!("\n--- Console Output ---");
        println!("{}", output);
        println!("----------------------\n");

        let success = output.contains("Linux") && output.contains("/ #");

        if success {
            println!("  ╔════════════════════════════════════════════════════════╗");
            println!("  ║  LINUX BOOT SIMULATION SUCCESSFUL.                   ║");
            println!("  ║                                                       ║");
            println!("  ║  Infrastructure proven:                               ║");
            println!("  ║  - Glyph VM can load kernel                           ║");
            println!("  ║  - RISC-V VM can execute it                           ║");
            println!("  ║  - Shell prompt appears on UART                       ║");
            println!("  ║                                                       ║");
            println!("  ║  Next step: Use real Linux kernel                     ║");
            println!("  ╚════════════════════════════════════════════════════════╝");
        }

        assert!(success, "Boot simulation failed");
    }
}
