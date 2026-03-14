//! Visual Kernel Boot CLI
//!
//! Boots the Geometry OS Visual Kernel, which loads the Window Manager
//! as VM #0 and allows it to SPATIAL_SPAWN child windows.
//!
//! Usage:
//!   cargo run --release --bin visual_kernel [--ubuntu path/to/ubuntu.rts.png]

use std::sync::Arc;
use std::time::{Duration, Instant};

fn main() {
    env_logger::Builder::from_env(env_logger::Env::default().default_filter_or("info")).init();

    // Parse arguments
    let args: Vec<String> = std::env::args().collect();
    let ubuntu_path = args.iter()
        .position(|a| a == "--ubuntu")
        .and_then(|i| args.get(i + 1).map(|s| s.clone()));

    println!();
    println!("  ╔═══════════════════════════════════════════════════════════════╗");
    println!("  ║              GEOMETRY OS - Visual Kernel Boot                 ║");
    println!("  ║                                                               ║");
    println!("  ║   The screen IS the CPU. Every glyph IS an instruction.      ║");
    println!("  ║   This is not a simulation. This is the real thing.          ║");
    println!("  ╚═══════════════════════════════════════════════════════════════╝");
    println!();

    // Initialize GPU
    println!("[GPU] Initializing WebGPU...");

    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = match pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: None,
        force_fallback_adapter: false,
    })) {
        Some(a) => a,
        None => {
            eprintln!("[GPU] No suitable GPU adapter found");
            std::process::exit(1);
        }
    };

    let (device, queue) = match pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Geometry OS GPU"),
            required_features: wgpu::Features::empty(),
            required_limits: wgpu::Limits::default(),
        },
        None,
    )) {
        Ok((d, q)) => (Arc::new(d), Arc::new(q)),
        Err(e) => {
            eprintln!("[GPU] Failed to create device: {}", e);
            std::process::exit(1);
        }
    };

    println!("[GPU] ✓ GPU initialized successfully");
    println!();

    // Create Visual Kernel config
    let mut config = infinite_map_rs::visual_kernel_boot::VisualKernelConfig::default();
    if let Some(path) = ubuntu_path {
        config.ubuntu_kernel_path = Some(path);
    }

    // Boot the Visual Kernel
    let mut kernel = infinite_map_rs::visual_kernel_boot::VisualKernel::new(
        device.clone(),
        queue.clone(),
        config,
    );

    if let Err(e) = kernel.boot() {
        eprintln!("[BOOT] Failed to boot Visual Kernel: {}", e);
        std::process::exit(1);
    }

    println!();
    println!("  ┌───────────────────────────────────────────────────────────────┐");
    println!("  │                    BOOT COMPLETE                             │");
    println!("  │                                                               │");
    println!("  │  VM #0: Window Manager (RUNNING) - Hit testing, event loop   │");
    println!("  │  VM #1: Available for SPATIAL_SPAWN (Ubuntu target)          │");
    println!("  │  VM #2-7: Available for child windows                        │");
    println!("  │                                                               │");
    println!("  │  Press Ctrl+C to shutdown                                    │");
    println!("  └───────────────────────────────────────────────────────────────┘");
    println!();

    // Run the main loop
    let frame_time = Duration::from_micros(16_667); // ~60 FPS
    let mut frame_count = 0u64;
    let start = Instant::now();

    println!("[EXEC] Starting execution loop (60 FPS target)...");
    println!();

    loop {
        let frame_start = Instant::now();

        // Execute one frame
        kernel.execute_frame();
        frame_count += 1;

        // Print status every 60 frames (~1 second)
        if frame_count % 60 == 0 {
            let elapsed = start.elapsed();
            let fps = (frame_count as f64) / elapsed.as_secs_f64();
            let vm_stats = kernel.get_vm_stats();
            let vm_list: Vec<String> = vm_stats.iter()
                .map(|(id, name)| format!("VM#{}:{}", id, name))
                .collect();

            println!("[FRAME {:08}] FPS: {:.1} | Active: {}",
                frame_count, fps, vm_list.join(", "));
        }

        // Sleep to maintain frame rate
        let elapsed = frame_start.elapsed();
        if elapsed < frame_time {
            std::thread::sleep(frame_time - elapsed);
        }
    }
}
