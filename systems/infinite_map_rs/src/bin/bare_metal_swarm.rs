use anyhow::{Context, Result};
use std::fs;
use std::path::Path;
use infinite_map_rs::backend::drm::amdgpu::device::AmdGpuDevice;
use infinite_map_rs::backend::drm::scanout::KmsScanout;

fn main() -> Result<()> {
    env_logger::init();
    log::info!("🧠 Geometry OS: Bare Metal Swarm Bootloader (Phase 4)");

    // 1. Open AMDGPU Device
    let mut device = AmdGpuDevice::open_first()
        .context("Failed to open AMDGPU device. Are you in the 'render' group?")?;

    // 2. Load Compiled Glyph Microcode (SPIR-V)
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
    // 10,000 agents * 16 bytes DNA = 160,000 bytes
    let dna_handle = device.alloc_buffer(160000, false)?;
    
    // State buffer (36 * 4 bytes)
    let state_handle = device.alloc_buffer(36 * 4, false)?;
    
    // Memory buffer (64KB)
    let memory_handle = device.alloc_buffer(65536, false)?;
    
    // Output Texture (100x100 RGBA8 = 40,000 bytes)
    let output_handle = device.alloc_buffer(40000, true)?;

    // 4. Load Swarm DNA (Neural Substrate)
    let dna_path = Path::new("../../apps/autoresearch/swarm_dna.bin");
    if dna_path.exists() {
        let dna_data = fs::read(dna_path)?;
        device.write_buffer(dna_handle, 0, &dna_data)?;
        log::info!("🧬 Injected Swarm DNA ({} bytes)", dna_data.len());
    } else {
        log::warn!("DNA file not found, using zeroed genome");
    }

    // 5. Build Push Constants
    // Matching the expected layout for our Bare Metal Bridge
    #[repr(C)]
    struct SwarmPushConstants {
        dna_addr: u64,
        state_addr: u64,
        memory_addr: u64,
        output_addr: u64,
        time: f32,
    }

    let push_constants = SwarmPushConstants {
        dna_addr: device.get_buffer_address(dna_handle)?,
        state_addr: device.get_buffer_address(state_handle)?,
        memory_addr: device.get_buffer_address(memory_handle)?,
        output_addr: device.get_buffer_address(output_handle)?,
        time: 1.0, // Fixed time for first frame
    };

    let push_bytes = unsafe {
        std::slice::from_raw_parts(
            &push_constants as *const SwarmPushConstants as *const u8,
            std::mem::size_of::<SwarmPushConstants>(),
        )
    };

    // 6. Dispatch the Swarm
    log::info!("🚀 Dispatching 10,000 agents to physical silicon...");
    device.dispatch_compute(shader_handle, push_bytes, 10000 / 128 + 1, 1, 1)?;

    // 7. Initialize Scanout
    let mut scanout = KmsScanout::new()?;
    log::info!("📺 Initializing KMS Scanout ({}x{})", scanout.width(), scanout.height());

    // In Phase 4, we perform a "Zero-Copy Blit" from the Output BO to the Primary Plane
    scanout.scanout_dmabuf(output_handle as i32, 100, 100)?;

    log::info!("✅ Phase 4 Boot Sequence Complete. Swarm is active on hardware.");

    Ok(())
}
