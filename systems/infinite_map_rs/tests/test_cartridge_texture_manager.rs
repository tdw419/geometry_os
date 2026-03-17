// ============================================
// CARTRIDGE TEXTURE MANAGER TESTS
// Phase 35.9.1 - Evolution Zone Texture Loading
// ============================================

use std::path::PathBuf;
use std::sync::Arc;

/// Helper to create device and queue (pattern from training_glyph_test.rs)
fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());

    let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::default(),
        compatible_surface: None,
        force_fallback_adapter: false,
    }))?;

    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Cartridge Texture Test Device"),
            required_features: wgpu::Features::empty(),
            required_limits: wgpu::Limits::default(),
        },
        None,
    ))
    .ok()?;

    Some((Arc::new(device), Arc::new(queue)))
}

/// Helper to create a bind group layout for textures
fn create_texture_bind_group_layout(device: &wgpu::Device) -> Arc<wgpu::BindGroupLayout> {
    Arc::new(device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
        label: Some("Cartridge Texture Bind Group Layout"),
        entries: &[
            wgpu::BindGroupLayoutEntry {
                binding: 0,
                visibility: wgpu::ShaderStages::FRAGMENT,
                ty: wgpu::BindingType::Texture {
                    sample_type: wgpu::TextureSampleType::Float { filterable: true },
                    view_dimension: wgpu::TextureViewDimension::D2,
                    multisampled: false,
                },
                count: None,
            },
            wgpu::BindGroupLayoutEntry {
                binding: 1,
                visibility: wgpu::ShaderStages::FRAGMENT,
                ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::Filtering),
                count: None,
            },
        ],
    }))
}

/// Helper to create a sampler
fn create_sampler(device: &wgpu::Device) -> Arc<wgpu::Sampler> {
    Arc::new(device.create_sampler(&wgpu::SamplerDescriptor {
        label: Some("Cartridge Texture Sampler"),
        address_mode_u: wgpu::AddressMode::ClampToEdge,
        address_mode_v: wgpu::AddressMode::ClampToEdge,
        address_mode_w: wgpu::AddressMode::ClampToEdge,
        mag_filter: wgpu::FilterMode::Linear,
        min_filter: wgpu::FilterMode::Linear,
        mipmap_filter: wgpu::FilterMode::Linear,
        ..Default::default()
    }))
}

/// Test fixture creator helper
/// Creates a test .rts.png file for testing
pub fn create_test_rts_png(path: &PathBuf, size: u32) -> Result<(), Box<dyn std::error::Error>> {
    use image::{ImageBuffer, Rgba};

    let mut image: ImageBuffer<Rgba<u8>, Vec<u8>> = ImageBuffer::new(size, size);

    // Fill with a gradient test pattern
    for y in 0..size {
        for x in 0..size {
            let r = ((x as f32 / size as f32) * 255.0) as u8;
            let g = ((y as f32 / size as f32) * 255.0) as u8;
            let b = 128;
            let a = 255;
            image.put_pixel(x, y, Rgba([r, g, b, a]));
        }
    }

    image.save(path)?;
    Ok(())
}

/// Test fixture cleanup helper
pub fn cleanup_test_rts_png(path: &PathBuf) {
    let _ = std::fs::remove_file(path);
}

#[test]
fn test_cartridge_texture_stats() {
    use infinite_map_rs::cartridge_texture_manager::CartridgeTextureStats;

    let stats = CartridgeTextureStats {
        total_textures: 5,
        total_vram_bytes: 1024 * 1024, // 1MB
    };

    assert_eq!(stats.total_textures, 5);
    assert_eq!(stats.total_vram_bytes, 1024 * 1024);
}

#[test]
fn test_cartridge_texture_stats_zero() {
    use infinite_map_rs::cartridge_texture_manager::CartridgeTextureStats;

    let stats = CartridgeTextureStats {
        total_textures: 0,
        total_vram_bytes: 0,
    };

    assert_eq!(stats.total_textures, 0);
    assert_eq!(stats.total_vram_bytes, 0);
}

#[test]
#[ignore] // Requires WGPU device - run with: cargo test -- --ignored
fn test_cartridge_texture_manager_creation() {
    // This test requires a real WGPU device
    // Will be tested manually or with integration tests
    // The manager should:
    // 1. Be creatable with device, queue, bind_group_layout, and sampler
    // 2. Start with an empty texture cache
    // 3. Return 0 from len() and true from is_empty()
}

#[test]
#[ignore = "Requires GPU"]
fn test_load_cartridge_texture() {
    // This test requires a full WGPU setup
    // Run with: cargo test --package infinite_map_rs test_load_cartridge_texture -- --ignored

    let (device, queue) = match create_test_device() {
        Some(d) => d,
        None => {
            println!("SKIP: No GPU available");
            return;
        }
    };

    let temp_dir = std::env::temp_dir();
    let test_file = temp_dir.join("test_cartridge.rts.png");

    // Create test fixture (64x64)
    create_test_rts_png(&test_file, 64).expect("Failed to create test fixture");

    // Create bind group layout and sampler
    let bind_group_layout = create_texture_bind_group_layout(&device);
    let sampler = create_sampler(&device);

    // Create CartridgeTextureManager
    let mut manager = infinite_map_rs::cartridge_texture_manager::CartridgeTextureManager::new(
        device,
        queue,
        bind_group_layout,
        sampler,
    );

    // Load the test cartridge
    let result = manager.load_cartridge("test_cartridge", &test_file);
    assert!(result.is_ok(), "Failed to load cartridge: {:?}", result.err());

    // Verify texture was loaded (has_texture returns true)
    assert!(manager.has_texture("test_cartridge"), "has_texture should return true");

    // Verify texture dimensions match (64, 64)
    let dims = manager.get_texture_info("test_cartridge");
    assert!(dims.is_some(), "get_texture_info should return Some");
    assert_eq!(dims.unwrap(), (64, 64), "Texture dimensions should be (64, 64)");

    // Verify stats() reports 1 texture
    let stats = manager.stats();
    assert_eq!(stats.total_textures, 1, "Should have 1 texture loaded");

    // Cleanup
    cleanup_test_rts_png(&test_file);
}

#[test]
fn test_cartridge_fixture_creator() {
    let temp_dir = std::env::temp_dir();
    let test_file = temp_dir.join("test_fixture_creator.rts.png");

    // Test fixture creation
    create_test_rts_png(&test_file, 32).expect("Failed to create test fixture");

    // Verify file exists
    assert!(test_file.exists(), "Test fixture file should exist");

    // Verify file size is reasonable (PNG compressed, so smaller than raw RGBA)
    let metadata = std::fs::metadata(&test_file).expect("Failed to get file metadata");
    assert!(
        metadata.len() > 100,
        "Test fixture should be a valid PNG file (compressed)"
    );

    // Cleanup
    cleanup_test_rts_png(&test_file);
    assert!(!test_file.exists(), "Test fixture should be cleaned up");
}

#[test]
#[ignore] // Requires WGPU device
fn test_load_nonexistent_cartridge() {
    // Test that loading a non-existent .rts.png returns an error
    // Requires device setup - will be integration tested
}

#[test]
#[ignore] // Requires WGPU device
fn test_load_invalid_png() {
    // Test that loading an invalid PNG returns an error
    // Requires device setup - will be integration tested
}

#[test]
#[ignore] // Requires WGPU device
fn test_cartridge_texture_cache_limit() {
    // Test that cache limit is enforced
    // Load more cartridges than max_cache_size
    // Verify least recently used textures are evicted
}

#[test]
#[ignore] // Requires WGPU device
fn test_cartridge_texture_removal() {
    // Test that remove_cartridge() works correctly
    // Load a cartridge, remove it, verify it's gone
}
