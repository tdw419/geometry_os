//! VCC Compute - Hardware-enforced Visual Consistency Contract.
//!
//! This module implements the GPU-side hashing of atlas textures
//! to ensure that the visual state matches the signed execution contract.

use anyhow::{Context, Result};
use naga::{back::spv, front::wgsl, valid::{Capabilities, ValidationFlags, Validator}};
use std::path::Path;

use super::compute::GlyphCompute;
use super::device::DrmDevice;

/// VCC Validator using GPU compute.
pub struct VccCompute {
    compute: GlyphCompute,
}

impl VccCompute {
    /// Create a new VCC compute validator.
    pub fn new(device: DrmDevice) -> Result<Self> {
        let compute = GlyphCompute::new(device)?;
        Ok(Self { compute })
    }

    /// Compute the hardware hash of an atlas texture.
    ///
    /// This compiles the VCC hashing WGSL to SPIR-V and executes it
    /// directly via the DRM compute pipeline.
    pub fn compute_atlas_hash(&mut self, atlas_pixels: &[f32]) -> Result<[u32; 8]> {
        // 1. Load WGSL shader
        let shader_path = "systems/infinite_map_rs/src/shaders/vcc_hash.wgsl";
        let wgsl_source = std::fs::read_to_string(shader_path)
            .context(format!("Failed to read VCC shader at {}", shader_path))?;

        // 2. Compile WGSL to SPIR-V using Naga
        let module = wgsl::parse_str(&wgsl_source)
            .context("Failed to parse WGSL VCC shader")?;
        
        let mut validator = Validator::new(ValidationFlags::all(), Capabilities::all());
        let info = validator.validate(&module)
            .context("Failed to validate WGSL module")?;

        let options = spv::Options::default();
        let spirv_binary = spv::write_vec(&module, &info, &options, None)
            .context("Failed to compile WGSL to SPIR-V")?;

        // 3. Execute on GPU
        // The atlas_pixels should be vec4<f32>, so we expect 4 floats per pixel.
        let output_size = 8; // [u32; 8]
        let result_f32 = self.compute.execute_spirv(&spirv_binary, atlas_pixels, output_size)?;

        // 4. Convert back to u32 hash
        let mut hash = [0u32; 8];
        for i in 0..8 {
            // In a real implementation, we would read raw bytes.
            // Here we bit_cast or convert from f32 since GlyphCompute returns Vec<f32>.
            hash[i] = result_f32[i] as u32;
        }

        Ok(hash)
    }

    /// Verify an atlas against a known VCC contract hash.
    pub fn verify_contract(&mut self, atlas_pixels: &[f32], contract_hash: &[u32; 8]) -> Result<bool> {
        let hw_hash = self.compute_atlas_hash(atlas_pixels)?;
        
        let matches = hw_hash == *contract_hash;
        if !matches {
            log::warn!("VCC Hardware Attestation FAILED!");
            log::warn!("  Contract Hash: {:?}", contract_hash);
            log::warn!("  Hardware Hash: {:?}", hw_hash);
        } else {
            log::info!("✅ VCC Hardware Attestation PASSED");
        }
        
        Ok(matches)
    }
}
