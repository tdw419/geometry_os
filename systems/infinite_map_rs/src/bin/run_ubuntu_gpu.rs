//! GPU-Native RISC-V Linux Boot
//!
//! Loads and boots RISC-V Linux kernel directly on GPU using WebGPU.
//! No QEMU, no CPU emulation - pure GPU compute shader execution.
//!
//! Usage:
//!   cargo run --bin run_ubuntu_gpu --release -- [options] [kernel]
//!
//! Options:
//!   --kernel <path>     Path to kernel image (ELF or flat binary)
//!   --rootfs <path>     Path to rootfs image (optional)
//!   --max-cycles N      Maximum execution cycles (default: 10M)
//!   --memory SIZE       VM memory size in MB (default: 256)
//!   --verbose           Enable verbose output
//!
//! Examples:
//!   # Boot from project kernel
//!   cargo run --bin run_ubuntu_gpu --release --
//!
//!   # Boot custom kernel with rootfs
//!   cargo run --bin run_ubuntu_gpu --release -- \
//!     --kernel /path/to/vmlinux \
//!     --rootfs /path/to/rootfs.ext2

use anyhow::{Context, Result};
use infinite_map_rs::riscv_linux_vm::{RiscVLinuxVM, RAM_BASE};
use std::env;
use std::io::Write;
use std::path::PathBuf;
use std::sync::Arc;
use std::time::Instant;

const DEFAULT_MAX_CYCLES: u32 = 10_000_000;
const DEFAULT_MEMORY_MB: u32 = 256;

const ELF_MAGIC: [u8; 4] = [0x7f, b'E', b'L', b'F'];
const EM_RISCV: u16 = 243;
const PT_LOAD: u32 = 1;

fn print_banner() {
    println!("╔══════════════════════════════════════════════════════════╗");
    println!("║         GPU-Native RISC-V Linux Boot                   ║");
    println!("║         Pure GPU Compute Shader Execution              ║");
    println!("╚══════════════════════════════════════════════════════════╝");
    println!();
}

fn print_usage(program: &str) {
    println!("Usage: {} [options]", program);
    println!();
    println!("Options:");
    println!("  --kernel <path>     Path to kernel image (ELF or flat binary)");
    println!("  --rootfs <path>     Path to rootfs image (optional)");
    println!(
        "  --max-cycles N      Maximum cycles (default: {})",
        DEFAULT_MAX_CYCLES
    );
    println!(
        "  --memory SIZE       VM memory in MB (default: {})",
        DEFAULT_MEMORY_MB
    );
    println!("  --verbose           Enable verbose output");
    println!("  --help, -h          Show this help");
    println!();
    println!("If no kernel specified, uses buildroot/output/images/Image");
}

fn is_elf_file(data: &[u8]) -> bool {
    data.len() >= 4 && &data[0..4] == ELF_MAGIC
}

fn is_riscv_elf(data: &[u8]) -> bool {
    if !is_elf_file(data) {
        return false;
    }
    let machine = u16::from_le_bytes([data[18], data[19]]);
    machine == EM_RISCV
}

fn load_kernel_binary(path: &PathBuf) -> Result<(Vec<u8>, u32)> {
    let data = std::fs::read(path).context("Failed to read kernel file")?;

    if is_riscv_elf(&data) {
        load_elf_kernel(&data)
    } else {
        Ok((data, RAM_BASE))
    }
}

fn load_elf_kernel(data: &[u8]) -> Result<(Vec<u8>, u32)> {
    if data.len() < 64 {
        anyhow::bail!("File too small to be an ELF file");
    }

    let phoff = u64::from_le_bytes([
        data[32], data[33], data[34], data[35], data[36], data[37], data[38], data[39],
    ]);
    let phnum = u16::from_le_bytes([data[56], data[57]]) as usize;
    let phentsize = u16::from_le_bytes([data[54], data[55]]) as usize;

    let entry = u32::from_le_bytes([data[24], data[25], data[26], data[27]]);

    println!("  Entry point: 0x{:08x}", entry);

    let mut min_vaddr: u32 = u32::MAX;
    let mut max_vaddr: u32 = 0;

    for i in 0..phnum {
        let offset = (phoff as usize) + (i * phentsize);
        if offset + phentsize > data.len() {
            continue;
        }

        let p_type = u32::from_le_bytes([
            data[offset],
            data[offset + 1],
            data[offset + 2],
            data[offset + 3],
        ]);
        if p_type != PT_LOAD {
            continue;
        }

        let p_vaddr = u32::from_le_bytes([
            data[offset + 16],
            data[offset + 17],
            data[offset + 18],
            data[offset + 19],
        ]);
        let p_memsz = u64::from_le_bytes([
            data[offset + 40],
            data[offset + 41],
            data[offset + 42],
            data[offset + 43],
            data[offset + 44],
            data[offset + 45],
            data[offset + 46],
            data[offset + 47],
        ]);

        if p_vaddr < min_vaddr {
            min_vaddr = p_vaddr;
        }
        let end = p_vaddr + p_memsz as u32;
        if end > max_vaddr {
            max_vaddr = end;
        }
    }

    let image_size = (max_vaddr - min_vaddr) as usize;
    let mut image = vec![0u8; image_size];

    for i in 0..phnum {
        let offset = (phoff as usize) + (i * phentsize);
        if offset + phentsize > data.len() {
            continue;
        }

        let p_type = u32::from_le_bytes([
            data[offset],
            data[offset + 1],
            data[offset + 2],
            data[offset + 3],
        ]);
        if p_type != PT_LOAD {
            continue;
        }

        let p_offset = u64::from_le_bytes([
            data[offset + 8],
            data[offset + 9],
            data[offset + 10],
            data[offset + 11],
            data[offset + 12],
            data[offset + 13],
            data[offset + 14],
            data[offset + 15],
        ]);
        let p_vaddr = u32::from_le_bytes([
            data[offset + 16],
            data[offset + 17],
            data[offset + 18],
            data[offset + 19],
        ]);
        let p_filesz = u64::from_le_bytes([
            data[offset + 32],
            data[offset + 33],
            data[offset + 34],
            data[offset + 35],
            data[offset + 36],
            data[offset + 37],
            data[offset + 38],
            data[offset + 39],
        ]);

        let dst_offset = (p_vaddr - min_vaddr) as usize;
        let src_start = p_offset as usize;
        let src_end = src_start + p_filesz as usize;

        if src_end <= data.len() && dst_offset + p_filesz as usize <= image.len() {
            image[dst_offset..dst_offset + p_filesz as usize]
                .copy_from_slice(&data[src_start..src_end]);
        }
    }

    let adjusted_entry = entry - min_vaddr + RAM_BASE;
    println!(
        "  Loaded {} bytes (range 0x{:08x}-0x{:08x})",
        image.len(),
        min_vaddr,
        max_vaddr
    );

    Ok((image, adjusted_entry))
}

fn find_default_kernel() -> Option<PathBuf> {
    let candidates = [
        "buildroot/output/images/Image",
        "../../buildroot/output/images/Image",
        "/home/jericho/zion/projects/geometry_os/geometry_os/buildroot/output/images/Image",
    ];

    for path in &candidates {
        let p = PathBuf::from(path);
        if p.exists() {
            return Some(p);
        }
    }
    None
}

fn initialize_wgpu() -> Result<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: None,
        force_fallback_adapter: false,
    }))
    .context("No suitable GPU adapter found")?;

    let info = adapter.get_info();
    println!(
        "  GPU: {} ({})",
        info.name,
        if info.backend == wgpu::Backend::Vulkan {
            "Vulkan"
        } else if info.backend == wgpu::Backend::Metal {
            "Metal"
        } else {
            "Other"
        }
    );

    let mut limits = wgpu::Limits::downlevel_defaults();
    limits.max_storage_buffers_per_shader_stage = 16;
    limits.max_storage_buffer_binding_size = 512 * 1024 * 1024;

    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("RISC-V Linux VM"),
            required_features: wgpu::Features::default(),
            required_limits: limits,
        },
        None,
    ))
    .context("Failed to create GPU device")?;

    Ok((Arc::new(device), Arc::new(queue)))
}

fn boot_on_gpu(
    kernel: &[u8],
    entry_point: u32,
    firmware: Option<&[u8]>,
    memory_mb: u32,
    max_cycles: u32,
    verbose: bool,
) -> Result<()> {
    println!("🚀 Initializing GPU...");
    let (device, queue) = initialize_wgpu()?;

    let memory_size = memory_mb * 1024 * 1024;
    println!("  Memory: {} MB", memory_mb);
    println!("  Entry: 0x{:08x}", entry_point);

    println!("\n🔧 Creating RISC-V VM...");
    let mut vm = RiscVLinuxVM::new(device, queue, memory_size);

    if let Some(fw) = firmware {
        println!("\n📦 Loading OpenSBI firmware ({} bytes)...", fw.len());
        vm.write_memory(RAM_BASE, fw);
    }

    println!("\n📦 Loading kernel ({} bytes)...", kernel.len());
    vm.load_kernel(kernel);

    println!("\n🔄 Initializing VM state...");
    vm.initialize();

    println!("\n⚡ Starting GPU execution...");
    println!("═══════════════════════════════════════════════════════════");

    let start_time = Instant::now();
    let mut last_console_len = 0u32;
    let mut cycles_at_last_output = 0u64;
    let dispatch_interval = 100u32;
    let instructions_per_dispatch = 10000u64;

    while vm.instruction_count < (max_cycles / dispatch_interval) as u64 {
        vm.run(dispatch_interval);

        let state = vm.read_state();
        let cycles = state.instruction_count as u64 * instructions_per_dispatch;

        if state
            .instruction_count
            .saturating_sub(cycles_at_last_output as u32 / instructions_per_dispatch as u32)
            >= dispatch_interval
        {
            let elapsed = start_time.elapsed().as_secs_f64();
            let mcycles = cycles as f64 / 1_000_000.0;
            let rate = mcycles / elapsed;

            print!(
                "\r  Dispatch: {:>8} | Instructions: {:>12} ({:>8.3}M) | {:>8.2} Mins/s",
                vm.instruction_count, state.instruction_count, mcycles, rate
            );

            if verbose || state.instruction_count.saturating_sub(last_console_len) > 1024 {
                if state.running == 0 {
                    println!(
                        "\n\n✅ VM stopped (exit_code={}, privilege={})",
                        state.exit_code, state.privilege
                    );
                    break;
                }
                last_console_len = state.instruction_count;
            }

            std::io::stdout().flush().ok();
            cycles_at_last_output = cycles;
        }
    }

    let final_state = vm.read_state();
    let total_instructions = final_state.instruction_count as u64 * instructions_per_dispatch;

    println!("\n\n═══════════════════════════════════════════════════════════");
    println!("📊 Execution Summary:");
    println!("   Dispatches: {}", vm.instruction_count);
    println!("   Shader iterations: {}", final_state.instruction_count);
    println!("   Total instructions: {}", total_instructions);
    println!("   Time: {:.2}s", start_time.elapsed().as_secs_f64());
    println!(
        "   Rate: {:.2} Mins/s",
        total_instructions as f64 / 1_000_000.0 / start_time.elapsed().as_secs_f64()
    );

    println!(
        "   VM State: {}",
        if final_state.running != 0 {
            "running"
        } else {
            "halted"
        }
    );
    println!("   Exit Code: {}", final_state.exit_code);
    println!(
        "   Privilege: {}",
        match final_state.privilege {
            0 => "U-mode",
            1 => "S-mode",
            3 => "M-mode",
            _ => "unknown",
        }
    );

    if !vm.console_output.is_empty() {
        println!("\n📺 Console Output (last 1024 chars):");
        println!("───────────────────────────────────────────────────");
        let output = String::from_utf8_lossy(&vm.console_output);
        let lines: Vec<&str> = output.lines().collect();
        for line in lines.iter().rev().take(20).rev() {
            println!("{}", line);
        }
        println!("───────────────────────────────────────────────────");
    }

    Ok(())
}

fn main() -> Result<()> {
    env_logger::Builder::from_env(env_logger::Env::default().default_filter_or("info")).init();

    let args: Vec<String> = env::args().collect();
    let program = args.first().map(|s| s.as_str()).unwrap_or("run_ubuntu_gpu");

    if args.len() < 2 || args.iter().any(|a| a == "--help" || a == "-h") {
        print_banner();
        print_usage(program);
        return Ok(());
    }

    let mut kernel_path: Option<PathBuf> = None;
    let mut rootfs_path: Option<PathBuf> = None;
    let mut max_cycles = DEFAULT_MAX_CYCLES;
    let mut memory_mb = DEFAULT_MEMORY_MB;
    let mut verbose = false;

    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--kernel" if i + 1 < args.len() => {
                kernel_path = Some(PathBuf::from(&args[i + 1]));
                i += 2;
            },
            "--rootfs" if i + 1 < args.len() => {
                rootfs_path = Some(PathBuf::from(&args[i + 1]));
                i += 2;
            },
            "--max-cycles" if i + 1 < args.len() => {
                max_cycles = args[i + 1].parse().context("Invalid max-cycles")?;
                i += 2;
            },
            "--memory" if i + 1 < args.len() => {
                memory_mb = args[i + 1].parse().context("Invalid memory size")?;
                i += 2;
            },
            "--verbose" | "-v" => {
                verbose = true;
                i += 1;
            },
            path if !path.starts_with('-') && kernel_path.is_none() => {
                kernel_path = Some(PathBuf::from(path));
                i += 1;
            },
            _ => {
                eprintln!("Unknown option: {}", args[i]);
                print_usage(program);
                anyhow::bail!("Invalid arguments");
            },
        }
    }

    let kernel_path = kernel_path
        .or_else(find_default_kernel)
        .context("No kernel specified and no default found")?;

    if !kernel_path.exists() {
        anyhow::bail!("Kernel not found: {}", kernel_path.display());
    }

    print_banner();

    println!("Kernel: {}", kernel_path.display());
    if let Some(ref rootfs) = rootfs_path {
        println!("Rootfs: {}", rootfs.display());
    }
    println!("Memory: {} MB", memory_mb);
    println!("Max cycles: {}", max_cycles);
    println!();

    println!("📖 Loading kernel...");
    let (kernel, entry_point) = load_kernel_binary(&kernel_path)?;

    let firmware = if let Some(parent) = kernel_path.parent() {
        let fw_path = parent.join("fw_jump.bin");
        if fw_path.exists() {
            println!("📦 Loading OpenSBI firmware from: {}", fw_path.display());
            Some(std::fs::read(&fw_path)?)
        } else {
            let fw_path = parent.join("fw_dynamic.bin");
            if fw_path.exists() {
                println!("📦 Loading OpenSBI firmware from: {}", fw_path.display());
                Some(std::fs::read(&fw_path)?)
            } else {
                println!("⚠️  No OpenSBI firmware found - kernel may not boot");
                None
            }
        }
    } else {
        None
    };

    boot_on_gpu(
        &kernel,
        entry_point,
        firmware.as_deref(),
        memory_mb,
        max_cycles,
        verbose,
    )?;

    Ok(())
}
