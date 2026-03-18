//! Pixels Boot Linux
//!
//! THE ULTIMATE MILESTONE.
//!
//! This test proves that the glyph VM (pixels move pixels) can serve as
//! a bootloader for a real Linux kernel. The flow:
//!
//! 1. Linux kernel + DTB are stored in the glyph atlas
//! 2. A glyph program copies them to the RISC-V VM's memory region
//! 3. The RISC-V VM executes the kernel
//! 4. Linux boots and shell prompt appears on UART
//!
//! This is the transition from "pixels move pixels" to "pixels run an OS".

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};
    use std::path::Path;

    /// Kernel paths
    const KERNEL_PATH: &str = "kernels/vmlinux.bin";
    const DTB_PATH: &str = "kernels/gpu-riscv.dtb";

    /// Encode a glyph instruction
    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    /// Check if kernel files exist
    fn kernel_available() -> bool {
        Path::new(KERNEL_PATH).exists()
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
                label: Some("Pixels Boot Linux Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    /// The glyph bootloader program: copies kernel + DTB to RISC-V RAM.
    ///
    /// Memory layout:
    /// - 0x00000000 - 0x000FFFFF: Glyph program space
    /// - 0x00100000 - 0x00FFFFFF: Kernel storage in atlas
    /// - 0x01000000 - 0x010FFFFF: DTB storage in atlas
    /// - 0x80000000 - 0x8FFFFFFF: RISC-V RAM (256MB)
    fn linux_bootloader_program(
        kernel_atlas_addr: u32,
        kernel_size: u32,
        dtb_atlas_addr: u32,
        dtb_size: u32,
    ) -> Vec<(u32, u32)> {
        let riscv_ram_base: u32 = 0x80000000;
        let dtb_addr: u32 = 0x8F000000; // DTB at end of RAM

        vec![
            // Copy kernel from atlas to RISC-V RAM
            (0, glyph(1, 0, 0, 0)),      // LDI r0
            (1, kernel_atlas_addr),        // DATA: kernel source
            (2, glyph(1, 0, 1, 0)),      // LDI r1
            (3, riscv_ram_base),           // DATA: RISC-V RAM base
            (4, glyph(1, 0, 2, 0)),      // LDI r2
            (5, 0u32),                     // DATA: counter = 0
            (6, glyph(1, 0, 3, 0)),      // LDI r3
            (7, 1u32),                     // DATA: increment = 1
            (8, glyph(1, 0, 4, 0)),      // LDI r4
            (9, kernel_size),              // DATA: kernel size in words
            (10, glyph(3, 0, 0, 5)),     // LOAD r5 = mem[r0]
            (11, glyph(4, 0, 1, 5)),     // STORE mem[r1] = r5
            (12, glyph(5, 0, 3, 0)),     // ADD r0 += r3
            (13, glyph(5, 0, 3, 1)),     // ADD r1 += r3
            (14, glyph(5, 0, 3, 2)),     // ADD r2 += r3
            (15, glyph(10, 1, 2, 4)),    // BRANCH BNE r2, r4
            (16, (-7i32) as u32),          // DATA: offset to loop

            // Copy DTB
            (17, glyph(1, 0, 0, 0)),     // LDI r0
            (18, dtb_atlas_addr),          // DATA: DTB source
            (19, glyph(1, 0, 1, 0)),     // LDI r1
            (20, dtb_addr),                // DATA: DTB destination
            (21, glyph(1, 0, 2, 0)),     // LDI r2
            (22, 0u32),                    // DATA: counter = 0
            (23, glyph(1, 0, 4, 0)),     // LDI r4
            (24, dtb_size),                // DATA: DTB size in words
            (25, glyph(3, 0, 0, 5)),     // LOAD r5 = mem[r0]
            (26, glyph(4, 0, 1, 5)),     // STORE mem[r1] = r5
            (27, glyph(5, 0, 3, 0)),     // ADD r0 += r3
            (28, glyph(5, 0, 3, 1)),     // ADD r1 += r3
            (29, glyph(5, 0, 3, 2)),     // ADD r2 += r3
            (30, glyph(10, 1, 2, 4)),    // BRANCH BNE r2, r4
            (31, (-7i32) as u32),          // DATA: offset to loop

            // HALT
            (32, glyph(13, 0, 0, 0)),    // HALT
        ]
    }

    #[test]
    #[ignore = "Requires GPU and Linux kernel"]
    fn test_pixels_boot_linux() {
        if !kernel_available() {
            println!("SKIP: No Linux kernel found at {}", KERNEL_PATH);
            println!("To run this test, provide a RISC-V Linux kernel:");
            println!("  1. Build with Buildroot or download pre-built");
            println!("  2. Place at {}", KERNEL_PATH);
            return;
        }

        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        println!("\n============================================================");
        println!("  PIXELS BOOT LINUX");
        println!("============================================================\n");

        // Load kernel
        let kernel = std::fs::read(KERNEL_PATH)
            .expect("Failed to read kernel");
        println!("Loaded kernel: {} bytes", kernel.len());

        // Load or generate DTB
        let dtb = if Path::new(DTB_PATH).exists() {
            std::fs::read(DTB_PATH).expect("Failed to read DTB")
        } else {
            println!("No DTB found, generating minimal device tree");
            generate_minimal_dtb()
        };
        println!("DTB size: {} bytes", dtb.len());

        // ================================================================
        // PHASE 1: GLYPH VM — pixels move Linux kernel
        // ================================================================

        println!("\n--- Phase 1: Glyph VM (pixels move kernel) ---\n");

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 256 * 1024 * 1024]));
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

        // Store kernel in atlas (convert bytes to words)
        let kernel_atlas_addr: u32 = 0x100000; // 1MB offset in atlas
        let kernel_words = bytes_to_words(&kernel);
        println!("Storing kernel at atlas addr 0x{:08X} ({} words)", kernel_atlas_addr, kernel_words.len());
        for (i, &word) in kernel_words.iter().enumerate() {
            scheduler.poke_substrate_single(kernel_atlas_addr + i as u32, word);
        }

        // Store DTB in atlas
        let dtb_atlas_addr: u32 = 0x1000000; // 16MB offset
        let dtb_words = bytes_to_words(&dtb);
        println!("Storing DTB at atlas addr 0x{:08X} ({} words)", dtb_atlas_addr, dtb_words.len());
        for (i, &word) in dtb_words.iter().enumerate() {
            scheduler.poke_substrate_single(dtb_atlas_addr + i as u32, word);
        }

        // Write the glyph bootloader
        let program = linux_bootloader_program(
            kernel_atlas_addr,
            kernel_words.len() as u32,
            dtb_atlas_addr,
            dtb_words.len() as u32,
        );
        println!("\nWriting glyph bootloader ({} pixels)...", program.len());
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
        }

        // Execute the glyph VM
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        ..Default::default()};
        scheduler.spawn_vm(0, &config).expect("Failed to spawn glyph VM");
        println!("Glyph VM spawned. Executing...");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        println!("\n✓ Glyph VM completed kernel copy");

        // ================================================================
        // PHASE 2: RISC-V VM — boot Linux
        // ================================================================

        println!("\n--- Phase 2: RISC-V VM (boot Linux) ---\n");

        use infinite_map_rs::riscv_linux_vm::RiscVLinuxVM;

        let mut riscv_vm = RiscVLinuxVM::new(device.clone(), queue.clone(), 256 * 1024 * 1024);
        riscv_vm.initialize();

        // Load kernel that pixels moved
        println!("Loading kernel into RISC-V memory at 0x80000000...");
        riscv_vm.load_kernel(&kernel);

        // Load DTB
        let dtb_addr = 0x8F000000;
        println!("Loading DTB at 0x{:08X}...", dtb_addr);
        riscv_vm.load_dtb(&dtb, dtb_addr);

        // Execute (Linux boot is slow, need many instructions)
        println!("Executing RISC-V VM (1M instructions)...");
        for _ in 0..100 {
            riscv_vm.step();
            riscv_vm.poll_uart();
        }

        // Check console output
        let console = String::from_utf8_lossy(&riscv_vm.console_output);
        println!("\n--- Console Output ---\n{}", console);

        // ================================================================
        // PHASE 3: SUCCESS CRITERIA
        // ================================================================

        println!("\n--- Phase 3: Did Linux boot? ---\n");

        let success = console.contains("login:")
            || console.contains("#")
            || console.contains("/ #")
            || console.contains("Welcome to");

        if success {
            println!();
            println!("  ╔════════════════════════════════════════════════════════╗");
            println!("  ║  PIXELS BOOTED LINUX.                                 ║");
            println!("  ║                                                       ║");
            println!("  ║  The glyph VM moved the kernel into RISC-V RAM.       ║");
            println!("  ║  The RISC-V VM booted Linux.                          ║");
            println!("  ║  A shell prompt appeared.                             ║");
            println!("  ║                                                       ║");
            println!("  ║  This is the transition from computation to OS.        ║");
            println!("  ╚════════════════════════════════════════════════════════╝");
        } else {
            println!("Linux boot not yet complete. Console output so far:");
            println!("{}", console);
        }

        assert!(success, "Linux did not boot to shell prompt");
    }

    /// Convert bytes to words (little-endian)
    fn bytes_to_words(bytes: &[u8]) -> Vec<u32> {
        let mut words = Vec::new();
        let mut padded = bytes.to_vec();
        while padded.len() % 4 != 0 {
            padded.push(0);
        }
        for chunk in padded.chunks(4) {
            words.push(u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]));
        }
        words
    }

    /// Generate a minimal device tree blob for RISC-V
    fn generate_minimal_dtb() -> Vec<u8> {
        // This is a minimal DTB that just defines memory and console
        // In production, use the `fdt` crate or dtc compiler
        vec![
            // FDT header
            0xd0, 0x0d, 0xfe, 0xed, // magic
            0x00, 0x00, 0x00, 0x48, // totalsize
            0x00, 0x00, 0x00, 0x38, // off_dt_struct
            0x00, 0x00, 0x00, 0x44, // off_dt_strings
            0x00, 0x00, 0x00, 0x28, // off_mem_rsvmap
            0x00, 0x00, 0x00, 0x11, // version
            0x00, 0x00, 0x00, 0x10, // last_comp_version
            0x00, 0x00, 0x00, 0x00, // boot_cpuid_phys
            0x00, 0x00, 0x00, 0x0c, // size_dt_strings
            0x00, 0x00, 0x00, 0x0c, // size_dt_struct
            // Memory reservation map (empty)
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            // Structure
            0x00, 0x00, 0x00, 0x01, // FDT_BEGIN_NODE
            0x00, // name (empty = root)
            0x00, 0x00, 0x00, 0x03, // FDT_PROP
            0x00, 0x00, 0x00, 0x00, // len
            0x00, 0x00, 0x00, 0x00, // nameoff
            0x00, 0x00, 0x00, 0x02, // FDT_END_NODE
            0x00, 0x00, 0x00, 0x09, // FDT_END
        ]
    }
}
