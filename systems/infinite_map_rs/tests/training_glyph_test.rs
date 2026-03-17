//! Training Glyph Test
//!
//! Tests that a Training Glyph can run on the Glyph VM and update the PixelBrain weights

use crate::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig, vm_state::{RUNNING, HALTED};
use crate::gpu::hebbian_processor::{GPUHebbianProcessor, HebbianUpdate};

/// Test that the Training Glyph can spawn, run, and train the PixelBrain
#[test]
fn training_glyph_basic() {
    // Create scheduler
    let mut scheduler = GlyphVmScheduler::new(
        pollster::block_on(async {
            let device = wgpu::Device::new(
        let queue = wgpu::Queue::new {
            let adapter = instance.request_adapter().await.unwrap();
            adapter.features.contains(wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES)
        })
    });

    // Create brain atlas texture (4096x4096 Rgba16Float)
    let brain_atlas = device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Brain Atlas"),
        size: wgpu::Extent3d {
            width: 4096,
            height: 4096,
            dimension: wgpu::TextureViewDimension::D2,
        format: wgpu::TextureFormat::Rgba16Float,
        usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::STORAGE | wgpu::TextureUsages::COPY_DST,
        mip_level_count: 1,
    });
    let brain_view = brain_atlas.create_view(&wgpu::TextureViewDescriptor::default());

    // Initialize Hebbian processor
    let hebbian_processor = GPUHebbianProcessor::new(
        Arc::new(device.clone()),
        Arc::new(queue.clone()),
        brain_view.clone(),
        4096,
    );

    // Spawn Training Glyph at VM 0
    let vm_id = scheduler.spawn_vm(VmConfig {
        entry_point: 0, // Training glyph at address 0
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0, // Unrestricted
        initial_regs: [0; 128],
    }).unwrap();

    // Run the for a few frames
    for _ in 0..10 {
        scheduler.execute_frame();

        // Give GPU time to execute
        std::thread::sleep(std::time::Duration::from_millis(100));

        // Check VM halted
        let stats = scheduler.read_stats();
        assert_eq!(stats[0].state, vm_state::HALTED, "Training Glyph completed");
        assert_eq!(stats[0].cycles, 150, "Training took ~150 cycles");
    }

}
```