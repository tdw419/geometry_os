//! GPU Capability Validation
//!
//! Validates that the GPU meets minimum requirements for Glyph VM execution.

use log::{info, warn};
use wgpu::Adapter;

/// Minimum GPU requirements for Geos-Boot v1.0
pub struct GpuRequirements {
    pub min_storage_buffer: u64,
    pub min_buffer_size: u64,
    pub min_workgroup_size_x: u32,
    pub min_bind_groups: u32,
}

impl GpuRequirements {
    /// Minimum requirements for Glyph VM
    pub const MINIMUM: Self = Self {
        min_storage_buffer: 128_000_000, // 128 MB
        min_buffer_size: 128_000_000,
        min_workgroup_size_x: 256,
        min_bind_groups: 4,
    };

    /// Recommended for best experience
    pub const RECOMMENDED: Self = Self {
        min_storage_buffer: 1_000_000_000, // 1 GB
        min_buffer_size: 1_000_000_000,
        min_workgroup_size_x: 1024,
        min_bind_groups: 8,
    };
}

pub struct ValidationResult {
    pub gpu_name: String,
    pub warnings: Vec<String>,
    pub meets_recommended: bool,
}

impl ValidationResult {
    pub fn log(&self) {
        info!("GPU: {}", self.gpu_name);
        if self.meets_recommended {
            info!("GPU meets all recommended requirements");
        } else {
            info!("GPU meets minimum requirements");
            for warning in &self.warnings {
                warn!("  WARNING: {}", warning);
            }
        }
    }
}

pub struct ValidationError {
    pub gpu_name: String,
    pub errors: Vec<String>,
}

impl std::fmt::Display for ValidationError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        writeln!(f, "GPU DOES NOT MEET MINIMUM REQUIREMENTS")?;
        writeln!(f, "GPU: {}", self.gpu_name)?;
        for error in &self.errors {
            writeln!(f, "  X {}", error)?;
        }
        writeln!(f, "Required: 128 MB storage buffer, 256+ compute threads")?;
        Ok(())
    }
}

/// Validate GPU meets minimum requirements
pub fn validate_gpu(adapter: &Adapter) -> Result<ValidationResult, ValidationError> {
    let limits = adapter.limits();
    let info = adapter.get_info();
    let mut warnings = Vec::new();
    let mut errors = Vec::new();

    if u64::from(limits.max_storage_buffer_binding_size) < GpuRequirements::MINIMUM.min_storage_buffer {
        errors.push(format!(
            "Storage buffer too small: {} MB (minimum: 128 MB)",
            limits.max_storage_buffer_binding_size / 1_000_000
        ));
    }

    if u64::from(limits.max_buffer_size) < GpuRequirements::MINIMUM.min_buffer_size {
        errors.push(format!(
            "Buffer size too small: {} MB",
            limits.max_buffer_size / 1_000_000
        ));
    }

    if limits.max_compute_workgroup_size_x < GpuRequirements::MINIMUM.min_workgroup_size_x {
        errors.push(format!(
            "Compute workgroup too small: {} (minimum: 256)",
            limits.max_compute_workgroup_size_x
        ));
    }

    if limits.max_bind_groups < GpuRequirements::MINIMUM.min_bind_groups {
        errors.push(format!(
            "Too few bind groups: {} (minimum: 4)",
            limits.max_bind_groups
        ));
    }

    // Check for recommended
    if u64::from(limits.max_storage_buffer_binding_size) < GpuRequirements::RECOMMENDED.min_storage_buffer {
        warnings.push("Storage buffer below 1 GB recommended".to_string());
    }

    if !errors.is_empty() {
        return Err(ValidationError {
            gpu_name: info.name.clone(),
            errors,
        });
    }

    let meets_recommended = warnings.is_empty();
    Ok(ValidationResult {
        gpu_name: info.name.clone(),
        warnings,
        meets_recommended,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_requirements_constants() {
        assert_eq!(GpuRequirements::MINIMUM.min_bind_groups, 4);
        assert_eq!(GpuRequirements::RECOMMENDED.min_bind_groups, 8);
    }
}
