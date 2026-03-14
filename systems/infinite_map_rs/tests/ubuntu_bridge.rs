//! Ubuntu RV64 Bridge Integration Test
//!
//! Tests execution of the Ubuntu kernel using the wgpu-based DrmGlyphExecutor.

//!
//! NOTE: GPU tests are skipped in CI environments

use std::sync::Arc;
use anyhow::Result;

/// Create a wgpu device for GPU tests
async fn create_wgpu_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::default(),
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await?;

    let (device, queue) = adapter
        .request_device(&wgpu::DeviceDescriptor::default(), None)
        .await
        .ok()?;

    Some((Arc::new(device), Arc::new(queue)))
}

