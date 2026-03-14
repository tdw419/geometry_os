use anyhow::{Context, Result};
use std::fs;
use std::path::Path;
use std::time::Instant;
use infinite_map_rs::backend::drm::amdgpu::device::AmdGpuDevice;
use infinite_map_rs::backend::drm::scanout::KmsScanout;

#[repr(C)]
struct SwarmPushConstants {
    dna_addr: u64,
    state_addr: u64,
    memory_addr: u64,
    output_addr: u64,
    input_addr: u64,
    time: f32,
}

fn main() -> Result<()> {
    env_logger::init();
    log::info!("🧠 Geometry OS: Bare Metal Interactive Swarm (Phase 6)");

    // 1. Open AMDGPU Device
    let mut device = AmdGpuDevice::open_first()
        .context("Failed to open AMDGPU device")?;

    // 2. Load Compiled Glyph Microcode (SPIR-V)
    // Ensure you ran: cargo run --bin wgsl_to_spirv
    let spv_path = Path::new("../visual_shell/web/shaders/glyph_microcode.spv");
    if !spv_path.exists() {
        anyhow::bail!("SPIR-V shader not found. Run 'cargo run --bin wgsl_to_spirv' first.");
    }
    let spirv_bytes = fs::read(spv_path)?;
    let spirv_words: Vec<u32> = spirv_bytes
        .chunks_exact(4)
        .map(|c| u32::from_le_bytes(c.try_into().unwrap()))
        .collect();

    let shader_handle = device.create_shader(&spirv_words)?;

    // 3. Allocate Buffers (Substrate)
    let dna_handle = device.alloc_buffer(160000, false)?;
    let state_handle = device.alloc_buffer(36 * 4, false)?;
    let memory_handle = device.alloc_buffer(65536, false)?;
    let output_handle = device.alloc_buffer(40000, true)?;
    let input_handle = device.alloc_buffer(1024, false)?;

    // 4. Load Swarm DNA
    let dna_path = Path::new("../../apps/autoresearch/swarm_dna.bin");
    if dna_path.exists() {
        let dna_data = fs::read(dna_path)?;
        device.write_buffer(dna_handle, 0, &dna_data)?;
        log::info!("🧬 Injected Swarm DNA ({} bytes)", dna_data.len());
    }

    // 5. Initialize Scanout
    let mut scanout = KmsScanout::new()?;
    log::info!("📺 Initializing KMS Scanout ({}x{})", scanout.width(), scanout.height());

    let start_time = Instant::now();
    let mut last_key: u32 = 0;

    log::info!("🚀 Swarm is ACTIVE. Press Ctrl+C to exit.");

    // 6. Main Execution Loop
    loop {
        let current_time = start_time.elapsed().as_secs_f32();

        // Simulate reading keyboard (Phase 6 will use libinput)
        // For now, we write a dummy value that agents react to
        let input_data = [last_key, 50, 50, 0]; // [Key, MouseX, MouseY, Click]
        let input_bytes: Vec<u8> = input_data.iter().flat_map(|v| v.to_le_bytes()).collect();
        device.write_buffer(input_handle, 0, &input_bytes)?;

        // Build Push Constants
        let push_constants = SwarmPushConstants {
            dna_addr: device.get_buffer_address(dna_handle)?,
            state_addr: device.get_buffer_address(state_handle)?,
            memory_addr: device.get_buffer_address(memory_handle)?,
            output_addr: device.get_buffer_address(output_handle)?,
            input_addr: device.get_buffer_address(input_handle)?,
            time: current_time,
        };

        let push_bytes = unsafe {
            std::slice::from_raw_parts(
                &push_constants as *const SwarmPushConstants as *const u8,
                std::mem::size_of::<SwarmPushConstants>(),
            )
        };

        // Dispatch Swarm
        device.dispatch_compute(shader_handle, push_bytes, 10000 / 128 + 1, 1, 1)?;

        // Zero-Copy Scanout
        scanout.scanout_dmabuf(output_handle as i32, 100, 100)?;

        // Frame pacing (~60 FPS)
        std::thread::sleep(std::time::Duration::from_millis(16));
        
        // Cycle dummy key for demo effect
        last_key = (last_key + 1) % 256;
    }
}
