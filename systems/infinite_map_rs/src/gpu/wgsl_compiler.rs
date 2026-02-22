//! WGSL Compiler for ExecutionZone
//!
//! Provides WebGPU shader compilation capabilities for WGSL compute shaders.
//! Parses workgroup size attributes and creates compute pipelines.

use regex::Regex;
use wgpu::{Device, ShaderModule, ShaderModuleDescriptor};

/// WGSL Compiler
///
/// Compiles WGSL compute shaders into WebGPU compute pipelines.
#[derive(Debug)]
pub struct WGSLCompiler {
    /// WebGPU device for shader compilation
    device: Device,
    /// Compiled shader module
    shader_module: Option<ShaderModule>,
    /// Workgroup size extracted from shader (x, y, z)
    workgroup_size: (u32, u32, u32),
}

impl WGSLCompiler {
    /// Create a new WGSL compiler
    ///
    /// # Arguments
    ///
    /// * `device` - WebGPU device for compilation
    pub fn new(device: Device) -> Self {
        Self {
            device,
            shader_module: None,
            workgroup_size: (1, 1, 1), // Default workgroup size
        }
    }

    /// Compile WGSL source into a compute pipeline
    ///
    /// # Arguments
    ///
    /// * `wgsl_source` - WGSL shader source code
    ///
    /// # Returns
    ///
    /// * `Ok(ShaderModule)` if compilation succeeds
    /// * `Err(String)` if compilation fails or workgroup size cannot be extracted
    pub fn compile_shader(&mut self, wgsl_source: &str) -> Result<(), String> {
        // Extract workgroup size from WGSL source
        self.workgroup_size = Self::extract_workgroup_size(wgsl_source)?;

        // Create shader module from WGSL source
        let shader_module = self.device.create_shader_module(ShaderModuleDescriptor {
            label: Some("ExecutionZone Shader"),
            source: wgpu::ShaderSource::Wgsl(wgsl_source.into()),
        });

        self.shader_module = Some(shader_module);

        Ok(())
    }

    /// Extract workgroup size from WGSL source
    ///
    /// Parses @workgroup_size(x, y, z) attribute from WGSL source.
    /// Supports single, two, or three dimensional workgroup sizes.
    ///
    /// # Arguments
    ///
    /// * `wgsl_source` - WGSL shader source code
    ///
    /// # Returns
    ///
    /// * `Ok((x, y, z))` - Workgroup size tuple
    /// * `Err(String)` - If workgroup size cannot be parsed or is invalid
    ///
    /// # Examples
    ///
    /// ```ignore
    /// // Single dimension: @workgroup_size(64) -> (64, 1, 1)
    /// let size = extract_workgroup_size("@compute @workgroup_size(64) fn main() {}")?;
    /// assert_eq!(size, (64, 1, 1));
    ///
    /// // Two dimensions: @workgroup_size(64, 64) -> (64, 64, 1)
    /// let size = extract_workgroup_size("@compute @workgroup_size(64, 64) fn main() {}")?;
    /// assert_eq!(size, (64, 64, 1));
    ///
    /// // Three dimensions: @workgroup_size(8, 8, 8) -> (8, 8, 8)
    /// let size = extract_workgroup_size("@compute @workgroup_size(8, 8, 8) fn main() {}")?;
    /// assert_eq!(size, (8, 8, 8));
    /// ```
    pub fn extract_workgroup_size(wgsl_source: &str) -> Result<(u32, u32, u32), String> {
        // Parse @workgroup_size(x, y, z) attribute
        // Supports: @workgroup_size(N), @workgroup_size(N, M), @workgroup_size(N, M, O)
        let re = Regex::new(r"@workgroup_size\(\s*(\d+)\s*(?:,\s*(\d+)\s*)?(?:,\s*(\d+)\s*)?\)")
            .map_err(|e| format!("Failed to create regex: {}", e))?;

        let captures = re
            .captures(wgsl_source)
            .ok_or_else(|| "No @workgroup_size attribute found in WGSL source".to_string())?;

        let x: u32 = captures
            .get(1)
            .and_then(|m| m.as_str().parse().ok())
            .ok_or_else(|| "Invalid workgroup size x dimension".to_string())?;

        let y: u32 = captures
            .get(2)
            .and_then(|m| m.as_str().parse().ok())
            .unwrap_or(1); // Default to 1 if not specified

        let z: u32 = captures
            .get(3)
            .and_then(|m| m.as_str().parse().ok())
            .unwrap_or(1); // Default to 1 if not specified

        // Validate workgroup size constraints
        // WebGPU requires workgroup dimensions to be <= 256 and total product <= 1024
        const MAX_DIMENSION: u32 = 256;
        const MAX_TOTAL: u32 = 1024;

        if x == 0 || y == 0 || z == 0 {
            return Err("Workgroup size dimensions must be non-zero".to_string());
        }

        if x > MAX_DIMENSION || y > MAX_DIMENSION || z > MAX_DIMENSION {
            return Err(format!(
                "Workgroup size dimensions must be <= {}, got ({}, {}, {})",
                MAX_DIMENSION, x, y, z
            ));
        }

        let total = x.saturating_mul(y).saturating_mul(z);
        if total > MAX_TOTAL {
            return Err(format!(
                "Workgroup size total must be <= {}, got {} ({}, {}, {})",
                MAX_TOTAL, total, x, y, z
            ));
        }

        Ok((x, y, z))
    }

    /// Get the compiled shader module
    ///
    /// # Returns
    ///
    /// * `Some(ShaderModule)` if shader has been compiled
    /// * `None` if no shader has been compiled yet
    pub fn shader_module(&self) -> Option<&ShaderModule> {
        self.shader_module.as_ref()
    }

    /// Get the workgroup size
    ///
    /// # Returns
    ///
    /// Workgroup size as (x, y, z) tuple
    pub fn workgroup_size(&self) -> (u32, u32, u32) {
        self.workgroup_size
    }

    /// Get reference to the WebGPU device
    ///
    /// # Returns
    ///
    /// Reference to the WebGPU device
    pub fn device(&self) -> &Device {
        &self.device
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_extract_workgroup_size_single_dimension() {
        let wgsl = r#"
        @compute @workgroup_size(64)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let size = WGSLCompiler::extract_workgroup_size(wgsl).unwrap();
        assert_eq!(size, (64, 1, 1));
    }

    #[test]
    fn test_extract_workgroup_size_two_dimensions() {
        let wgsl = r#"
        @compute @workgroup_size(32, 32)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let size = WGSLCompiler::extract_workgroup_size(wgsl).unwrap();
        assert_eq!(size, (32, 32, 1));
    }

    #[test]
    fn test_extract_workgroup_size_three_dimensions() {
        let wgsl = r#"
        @compute @workgroup_size(8, 8, 8)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let size = WGSLCompiler::extract_workgroup_size(wgsl).unwrap();
        assert_eq!(size, (8, 8, 8));
    }

    #[test]
    fn test_extract_workgroup_size_with_spaces() {
        let wgsl = r#"
        @compute @workgroup_size( 32 , 16 )
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let size = WGSLCompiler::extract_workgroup_size(wgsl).unwrap();
        assert_eq!(size, (32, 16, 1));
    }

    #[test]
    fn test_extract_workgroup_size_not_found() {
        let wgsl = r#"
        @compute
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let result = WGSLCompiler::extract_workgroup_size(wgsl);
        assert!(result.is_err());
        assert!(result
            .unwrap_err()
            .contains("No @workgroup_size attribute found"));
    }

    #[test]
    fn test_extract_workgroup_size_zero_dimension() {
        let wgsl = r#"
        @compute @workgroup_size(0, 1, 1)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let result = WGSLCompiler::extract_workgroup_size(wgsl);
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("must be non-zero"));
    }

    #[test]
    fn test_extract_workgroup_size_exceeds_max_dimension() {
        let wgsl = r#"
        @compute @workgroup_size(257, 1, 1)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let result = WGSLCompiler::extract_workgroup_size(wgsl);
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("must be <="));
    }

    #[test]
    fn test_extract_workgroup_size_exceeds_max_total() {
        let wgsl = r#"
        @compute @workgroup_size(64, 64, 64)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let result = WGSLCompiler::extract_workgroup_size(wgsl);
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("total must be <="));
    }

    #[test]
    fn test_extract_workgroup_size_max_valid_total() {
        let wgsl = r#"
        @compute @workgroup_size(256, 4, 1)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let size = WGSLCompiler::extract_workgroup_size(wgsl).unwrap();
        assert_eq!(size, (256, 4, 1)); // 256 * 4 * 1 = 1024 (max total)
    }

    #[test]
    fn test_extract_workgroup_size_max_valid_dimension() {
        let wgsl = r#"
        @compute @workgroup_size(256, 1, 1)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let size = WGSLCompiler::extract_workgroup_size(wgsl).unwrap();
        assert_eq!(size, (256, 1, 1));
    }
}
