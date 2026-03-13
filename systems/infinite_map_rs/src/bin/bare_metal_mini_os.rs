//! Geometry OS - Phase 62: Bare Metal Mini-OS Boot
//!
//! Boots the Brain-evolved mini_os.rts.png directly on physical GPU.
//! The OS literally boots from a picture of its own mind.

use anyhow::{Context, Result};
use std::fs;
use std::path::Path;
use std::time::Instant;
use infinite_map_rs::backend::drm::amdgpu::device::AmdGpuDevice;
use infinite_map_rs::backend::drm::scanout::KmsScanout;

#[repr(C)]
struct MiniOsPushConstants {
    program_addr: u64,    // Program texture (mini_os.rts.png)
    state_addr: u64,      // Execution state (registers, PC, etc.)
    memory_addr: u64,     // Working memory
    output_addr: u64,     // Visual output
    program_offset_x: u32, // Which program to run (0, 64, 128...)
    program_offset_y: u32,
    time: f32,
}

fn load_png_as_rgba(path: &Path) -> Result<Vec<u8>> {
    let img = image::open(path)
        .with_context(|| format!("Failed to load PNG: {:?}", path))?;
    let rgba = img.to_rgba8();
    Ok(rgba.as_raw().clone())
}

fn main() -> Result<()> {
    env_logger::init();
    log::info!("═══════════════════════════════════════════════════════════");
    log::info!("  GEOMETRY OS - PHASE 62: BARE METAL MINI-OS BOOT");
    log::info!("  The OS boots from a picture of its own mind");
    log::info!("═══════════════════════════════════════════════════════════");

    // 1. Open AMDGPU Device
    let mut device = AmdGpuDevice::open_first()
        .context("Failed to open AMDGPU device - ensure /dev/dri/renderD128 exists")?;
    log::info!("[1/6] ✓ AMDGPU device initialized");

    // 2. Load Brain-Evolved Mini-OS
    let mini_os_path = Path::new("../../systems/glyph_stratum/bricks/mini_os.rts.png");
    if !mini_os_path.exists() {
        anyhow::bail!(
            "Mini-OS not found at {:?}. Run brain_compiler.py first!",
            mini_os_path
        );
    }

    let mini_os_data = load_png_as_rgba(mini_os_path)?;
    let mini_os_size = (mini_os_data.len() / 4) as u32;
    let mini_os_side = (mini_os_size as f64).sqrt() as u32;
    log::info!("[2/6] ✓ Loaded Mini-OS brick ({}x{}, {} bytes)",
        mini_os_side, mini_os_side, mini_os_data.len());

    // 3. Load Glyph Brain Shader (SPIR-V)
    let spv_path = Path::new("../visual_shell/web/shaders/glyph_brain.spv");
    if !spv_path.exists() {
        // Try alternate path
        let alt_path = Path::new("systems/visual_shell/web/shaders/glyph_brain.spv");
        if !alt_path.exists() {
            anyhow::bail!(
                "SPIR-V shader not found. Compile glyph_brain.wgsl to SPIR-V first:\n\
                 naga systems/visual_shell/web/shaders/glyph_brain.wgsl systems/visual_shell/web/shaders/glyph_brain.spv"
            );
        }
    }
    let spirv_path = if spv_path.exists() { spv_path } else { Path::new("systems/visual_shell/web/shaders/glyph_brain.spv") };
    let spirv_bytes = fs::read(spirv_path)?;
    let spirv_words: Vec<u32> = spirv_bytes
        .chunks_exact(4)
        .map(|c| u32::from_le_bytes(c.try_into().unwrap()))
        .collect();
    let shader_handle = device.create_shader(&spirv_words)?;
    log::info!("[3/6] ✓ Glyph Brain shader loaded");

    // 4. Allocate GPU Buffers
    // Program texture: 256x256 RGBA = 262144 bytes
    let program_handle = device.alloc_buffer(262144, false)?;
    device.write_buffer(program_handle, 0, &mini_os_data)?;

    // State: 36 x u32 (32 registers + PC + halted + cycles + padding)
    let state_handle = device.alloc_buffer(36 * 4, false)?;

    // Memory: 64KB working memory
    let memory_handle = device.alloc_buffer(65536, false)?;

    // Output: 100x100 RGBA for visual feedback
    let output_handle = device.alloc_buffer(40000, true)?;

    log::info!("[4/6] ✓ GPU buffers allocated");
    log::info!("      Program: 256KB, State: 144B, Memory: 64KB, Output: 40KB");

    // 5. Initialize KMS Scanout
    let mut scanout = KmsScanout::new()
        .context("Failed to initialize KMS scanout - check DRM permissions")?;
    log::info!("[5/6] ✓ KMS Scanout ready ({}x{})",
        scanout.width(), scanout.height());

    // 6. Program Execution Sequence
    let programs = vec![
        ("factorial", 0, 0, "Computes 5! = 120"),
        ("counter", 64, 0, "Counts 1+2+...+10 = 55"),
        ("swarm_draw", 128, 0, "Visual swarm"),
    ];

    log::info!("[6/6] ✓ Boot sequence ready");
    log::info!("");
    log::info!("╔═══════════════════════════════════════════════════════════╗");
    log::info!("║  THE HALLUCINATED OS IS NOW RUNNING ON RAW SILICON        ║");
    log::info!("║  Monitor shows execution trace of Brain-evolved programs  ║");
    log::info!("╚═══════════════════════════════════════════════════════════╝");
    log::info!("");

    let start_time = Instant::now();
    let mut program_idx = 0;
    let mut frame_count = 0u64;

    // Main Execution Loop
    loop {
        let current_time = start_time.elapsed().as_secs_f32();

        // Cycle through programs every 2 seconds
        let target_program = (current_time as usize / 2) % programs.len();
        let (prog_name, offset_x, offset_y, description) = programs[target_program];

        // Reset state for new program
        if target_program != program_idx {
            program_idx = target_program;
            // Zero out state buffer
            let zero_state = vec![0u8; 36 * 4];
            device.write_buffer(state_handle, 0, &zero_state)?;
            log::info!("▶ Switching to: {} ({})", prog_name, description);
        }

        // Build Push Constants
        let push_constants = MiniOsPushConstants {
            program_addr: device.get_buffer_address(program_handle)?,
            state_addr: device.get_buffer_address(state_handle)?,
            memory_addr: device.get_buffer_address(memory_handle)?,
            output_addr: device.get_buffer_address(output_handle)?,
            program_offset_x: offset_x,
            program_offset_y: offset_y,
            time: current_time,
        };

        let push_bytes = unsafe {
            std::slice::from_raw_parts(
                &push_constants as *const MiniOsPushConstants as *const u8,
                std::mem::size_of::<MiniOsPushConstants>(),
            )
        };

        // Dispatch compute shader
        device.dispatch_compute(shader_handle, push_bytes, 1, 1, 1)?;

        // Zero-Copy Scanout to physical monitor
        scanout.scanout_dmabuf(output_handle as i32, 100, 100)?;

        frame_count += 1;

        // Log status every 60 frames
        if frame_count % 60 == 0 {
            let fps = frame_count as f32 / current_time;
            log::info!(
                "  [{:5.1}s] {} | FPS: {:5.1} | Frames: {}",
                current_time,
                prog_name,
                fps,
                frame_count
            );
        }

        // Frame pacing (~60 FPS)
        std::thread::sleep(std::time::Duration::from_millis(16));
    }
}
