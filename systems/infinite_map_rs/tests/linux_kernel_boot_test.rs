//! Linux Kernel Boot Test
//!
//! Boots a real RISC-V 32-bit Linux kernel via the Glyph VM → RISC-V VM pipeline.
//!
//! Prerequisites:
//! - Buildroot built for qemu_riscv32_virt_defconfig
//! - Kernel at buildroot/output/images/Image
//! - Rootfs at buildroot/output/images/rootfs.ext2
//!
//! Flow:
//! 1. Load Linux kernel (Image) into RISC-V VM memory
//! 2. Set up entry point (typically 0x80000000 for QEMU virt)
//! 3. Execute kernel via GPU compute shader
//! 4. Watch for Linux boot messages on UART

#[cfg(test)]
mod tests {
    use std::sync::Arc;
    use infinite_map_rs::riscv_executor::RiscvExecutor;
    use infinite_map_rs::gpu_capabilities::GpuCapabilities;

    fn create_test_device() -> Option<(Arc<wgpu::Adapter>, Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
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
                label: Some("Linux Kernel Boot Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;
        Some((Arc::new(adapter), Arc::new(device), Arc::new(queue)))
    }

    fn get_kernel_path() -> std::path::PathBuf {
        // Look for kernel relative to project root
        let manifest_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap_or_else(|_| ".".to_string());
        let mut path = std::path::PathBuf::from(&manifest_dir);

        // Navigate to project root (../../.. from tests/)
        for _ in 0..4 {
            path.pop();
        }

        path.push("buildroot/output/images/Image");
        path
    }

    fn get_rootfs_path() -> std::path::PathBuf {
        let manifest_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap_or_else(|_| ".".to_string());
        let mut path = std::path::PathBuf::from(&manifest_dir);

        for _ in 0..4 {
            path.pop();
        }

        path.push("buildroot/output/images/rootfs.ext2");
        path
    }

    /// Test that boots a real Linux kernel
    ///
    /// This is ignored by default because:
    /// 1. It requires building the kernel first (30-60 minutes)
    /// 2. The kernel boot is slow (many seconds)
    /// 3. We don't have full MMU emulation yet
    #[test]
    #[ignore]
    fn linux_kernel_boot() {
        let Some((adapter, device, queue)) = create_test_device() else {
            println!("Skipping: no GPU available");
            return;
        };

        let kernel_path = get_kernel_path();
        let rootfs_path = get_rootfs_path();

        // Check if kernel exists
        if !kernel_path.exists() {
            println!("Skipping: kernel not found at {:?}", kernel_path);
            println!("Build with: cd buildroot && make qemu_riscv32_virt_defconfig && make -j$(nproc)");
            return;
        }

        println!("=== LINUX KERNEL BOOT TEST ===");
        println!("Kernel: {:?}", kernel_path);

        // Load kernel
        let kernel_data = std::fs::read(&kernel_path)
            .expect("Failed to read kernel");
        println!("Kernel size: {} bytes", kernel_data.len());

        // Check for rootfs
        if rootfs_path.exists() {
            println!("Rootfs: {:?}", rootfs_path);
        }

        // Create RISC-V executor with Linux VM shader
        let caps = pollster::block_on(GpuCapabilities::new(&adapter));
        let mut riscv_vm = RiscvExecutor::new_with_caps(device, queue, &caps);

        // Linux kernel entry point for QEMU virt machine
        // Typically 0x80000000 for RV32
        let entry_point = 0x8000_0000u64;

        // Load kernel at entry point
        riscv_vm.load_binary(&kernel_data, entry_point)
            .expect("Failed to load kernel");

        println!("Kernel loaded at 0x{:08x}", entry_point);
        println!("Starting execution...");

        // Set PC to entry point
        riscv_vm.set_pc(entry_point as u32);

        // Run for many frames - Linux boot takes a while
        let max_frames = 10000;
        let mut total_instructions = 0u64;

        for frame in 0..max_frames {
            riscv_vm.execute_frame();

            // Check for output
            let output = riscv_vm.get_console_output();
            if !output.is_empty() {
                println!("UART: {}", output);
            }

            // Check if halted
            if riscv_vm.is_halted() {
                println!("VM halted at frame {}", frame);
                break;
            }

            if frame % 100 == 0 {
                println!("Frame {} running", frame);
            }

            // Check for Linux boot indicators
            // The kernel should print "Linux version" early in boot
        }

        println!("=== BOOT COMPLETE ===");
        println!("Final status: halted={}", riscv_vm.is_halted());
    }

    /// Minimal test that just checks the kernel file can be read
    #[test]
    fn linux_kernel_exists() {
        let kernel_path = get_kernel_path();
        if kernel_path.exists() {
            let metadata = std::fs::metadata(&kernel_path).unwrap();
            println!("Kernel found: {:?} ({} bytes)", kernel_path, metadata.len());
            assert!(metadata.len() > 1_000_000, "Kernel seems too small");
        } else {
            println!("Kernel not found at {:?}", kernel_path);
            println!("To build:");
            println!("  cd buildroot");
            println!("  make qemu_riscv32_virt_defconfig");
            println!("  make -j$(nproc)");
        }
    }
}
