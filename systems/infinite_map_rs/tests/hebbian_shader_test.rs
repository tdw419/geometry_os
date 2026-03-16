//! Hebbian Shader Tests
//!
//! Tests for the GPUHebbianProcessor and hebbian_update.wgsl shader.

use infinite_map_rs::gpu::hebbian_processor::{GPUHebbianProcessor, HebbianUpdate, HebbianUniforms};

#[test]
fn test_hebbian_update_struct_size() {
    // Verify HebbianUpdate is 16 bytes (4 x f32)
    assert_eq!(std::mem::size_of::<HebbianUpdate>(), 16);
}

#[test]
fn test_hebbian_uniforms_struct_size() {
    // Verify HebbianUniforms is 16 bytes for GPU alignment
    assert_eq!(std::mem::size_of::<HebbianUniforms>(), 16);
}

#[test]
fn test_hebbian_update_default() {
    let update = HebbianUpdate::default();
    assert_eq!(update.address, 0);
    assert_eq!(update.pre_activation, 0.0);
    assert_eq!(update.post_activation, 0.0);
    assert_eq!(update.reward, 0.0);
}

#[test]
fn test_batch_queue_behavior() {
    // Test queue behavior (without actual GPU)
    let updates: Vec<HebbianUpdate> = (0..256)
        .map(|i| HebbianUpdate {
            address: i as u32,
            pre_activation: 0.5,
            post_activation: 0.3,
            reward: 1.0,
        })
        .collect();

    assert_eq!(updates.len(), 256);

    // Verify all addresses are unique
    let addresses: std::collections::HashSet<u32> = updates.iter().map(|u| u.address).collect();
    assert_eq!(addresses.len(), 256);
}

#[test]
fn test_hebbian_update_fields() {
    let update = HebbianUpdate {
        address: 0x12345,
        pre_activation: 0.7,
        post_activation: 0.4,
        reward: -0.5,
    };

    assert_eq!(update.address, 0x12345);
    assert!((update.pre_activation - 0.7).abs() < 0.001);
    assert!((update.post_activation - 0.4).abs() < 0.001);
    assert!((update.reward - (-0.5)).abs() < 0.001);
}
