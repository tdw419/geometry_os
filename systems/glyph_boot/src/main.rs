//! Glyph Boot - Minimal GPU Seed for Geometry OS
//!
//! This is the minimal Rust seed that boots the glyph-native infinite map.
//! All rendering, windowing, and input logic runs as glyphs on GPU.
//!
//! The Rust process only:
//! 1. Initializes WebGPU
//! 2. Loads the .rts.png glyph program into GPU texture
//! 3. Spawns VM #0 at entry point 0x0000
//! 4. Calls execute_frame() at 60 FPS

use std::sync::Arc;
use std::time::{Duration, Instant};

mod scheduler;
mod rts_loader;

use scheduler::GlyphScheduler;
use rts_loader::RtsLoader;

fn main() {
    env_logger::Builder::from_env(env_logger::Env::default().default_filter_or("info")).init();

    let args: Vec<String> = std::env::args().collect();
    let rts_path = args.get(1).cloned().unwrap_or_else(|| "seed.rts.png".to_string());

    println!();
    println!("  ╔═══════════════════════════════════════════════════════════════╗");
    println!("  ║              GEOMETRY OS - Glyph-Native Boot                  ║");
    println!("  ║                                                               ║");
    println!("  ║   The screen IS the CPU. Every glyph IS an instruction.      ║");
    println!("  ║   This is not a simulation. This is the real thing.          ║");
    println!("  ╚═══════════════════════════════════════════════════════════════╝");
    println!();

    // Step 1: Initialize GPU
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
            label: Some("Geometry OS Glyph Boot"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
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

    println!("[GPU] ✓ GPU initialized: {:?}", adapter.get_info());
    println!();

    // Step 2: Load RTS texture
    println!("[RTS] Loading glyph program from: {}", rts_path);

    let rts_loader = match RtsLoader::load(&device, &queue, &rts_path) {
        Ok(loader) => loader,
        Err(e) => {
            eprintln!("[RTS] Failed to load: {}", e);
            std::process::exit(1);
        }
    };

    println!("[RTS] ✓ Loaded {}x{} texture ({} instructions)",
        rts_loader.width(), rts_loader.height(), rts_loader.instruction_count());
    println!();

    // Step 3: Create Glyph Scheduler
    println!("[SCHED] Initializing Glyph VM Scheduler...");

    let mut scheduler = GlyphScheduler::new(device, queue, rts_loader);

    // Spawn VM #0 at Hilbert origin (entry point 0x0000)
    scheduler.spawn_vm(0, 0x0000);

    println!("[SCHED] ✓ VM #0 spawned at entry 0x0000");
    println!();

    println!("  ┌───────────────────────────────────────────────────────────────┐");
    println!("  │                    BOOT COMPLETE                             │");
    println!("  │                                                               │");
    println!("  │  VM #0: Glyph Program (RUNNING)                              │");
    println!("  │  VM #1-7: Available for SPATIAL_SPAWN                        │");
    println!("  │                                                               │");
    println!("  │  The glyph IS the program. The screen IS the memory.        │");
    println!("  │  Press Ctrl+C to shutdown                                    │");
    println!("  └───────────────────────────────────────────────────────────────┘");
    println!();

    // Step 4: Main Loop
    println!("[EXEC] Starting execution loop (60 FPS target)...");
    println!();

    let frame_time = Duration::from_micros(16_667);
    let mut frame_count = 0u64;
    let start = Instant::now();

    loop {
        let frame_start = Instant::now();

        // Execute one frame
        scheduler.execute_frame();
        frame_count += 1;

        // Print status every 60 frames (~1 second)
        if frame_count % 60 == 0 {
            let elapsed = start.elapsed();
            let fps = (frame_count as f64) / elapsed.as_secs_f64();
            let stats = scheduler.get_stats();

            println!("[FRAME {:08}] FPS: {:.1} | Active VMs: {} | Cycles: {}",
                frame_count, fps, stats.active_vms, stats.total_cycles);
        }

        // Sleep to maintain frame rate
        let elapsed = frame_start.elapsed();
        if elapsed < frame_time {
            std::thread::sleep(frame_time - elapsed);
        }
    }
}
