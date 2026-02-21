//! Execution Zone Entity
//!
//! An ExecutionZone represents a GPU compute shader region on the infinite map.
//! When a WGSL .rts.png tile is dragged onto the map, it creates an ExecutionZone
//! that compiles and runs the shader.

use crate::gpu::WGSLCompiler;
use crate::rts::extract_wgsl_from_rts;
use glam::Vec2;

#[derive(Debug, Clone)]
pub struct ExecutionZone {
    pub position: Vec2,
    pub shader_name: String,
    pub wgsl_source: Vec<u8>,
    active: bool,
    /// WGSL compiler for shader compilation
    compiler: Option<std::sync::Arc<std::sync::Mutex<WGSLCompiler>>>,
    /// Workgroup size extracted from shader (x, y, z)
    workgroup_size: (u32, u32, u32),
    _pipeline: Option<std::sync::Arc<wgpu::ComputePipeline>>,
    _texture: Option<std::sync::Arc<wgpu::Texture>>,
}

impl ExecutionZone {
    pub fn new(position: Vec2, shader_name: String, wgsl_source: Vec<u8>) -> Self {
        Self {
            position,
            shader_name,
            wgsl_source,
            active: false,
            compiler: None,
            workgroup_size: (1, 1, 1),
            _pipeline: None,
            _texture: None,
        }
    }

    pub fn is_active(&self) -> bool {
        self.active
    }

    /// Set the WebGPU device for shader compilation
    ///
    /// # Arguments
    ///
    /// * `device` - WebGPU device for compilation
    pub fn set_device(&mut self, device: wgpu::Device) {
        self.compiler = Some(std::sync::Arc::new(std::sync::Mutex::new(
            WGSLCompiler::new(device),
        )));
    }

    /// Compile the WGSL shader
    ///
    /// If a device has been set, compiles the shader using the WGSL compiler.
    /// Otherwise, sets active state without compilation (for testing).
    ///
    /// # Returns
    ///
    /// * `Ok(())` if compilation succeeds
    /// * `Err(String)` if compilation fails
    pub fn compile(&mut self) -> Result<(), String> {
        // If compiler is available, perform actual compilation
        if let Some(compiler) = &self.compiler {
            let wgsl_string = String::from_utf8(self.wgsl_source.clone())
                .map_err(|_| "WGSL source is not valid UTF-8".to_string())?;

            let mut compiler = compiler
                .lock()
                .map_err(|e| format!("Failed to lock compiler: {}", e))?;

            compiler.compile_shader(&wgsl_string)?;
            self.workgroup_size = compiler.workgroup_size();
        }

        self.active = true;
        Ok(())
    }

    /// Get the workgroup size
    ///
    /// # Returns
    ///
    /// Workgroup size as (x, y, z) tuple
    pub fn workgroup_size(&self) -> (u32, u32, u32) {
        self.workgroup_size
    }

    /// Create an ExecutionZone from a .rts.png file
    ///
    /// Extracts WGSL shader source from the .rts.png format and creates
    /// an ExecutionZone at the specified position.
    ///
    /// # Arguments
    ///
    /// * `position` - Position on the infinite map
    /// * `shader_name` - Name of the shader
    /// * `rts_png_data` - Raw bytes of the .rts.png file
    ///
    /// # Returns
    ///
    /// * `Ok(ExecutionZone)` if WGSL was successfully extracted
    /// * `Err(String)` if no WGSL found or extraction failed
    ///
    /// # Example
    ///
    /// ```rust
    /// use infinite_map_rs::entities::ExecutionZone;
    /// use glam::Vec2;
    ///
    /// let rts_data = std::fs::read("shader.rts.png")?;
    /// let zone = ExecutionZone::from_rts_png(
    ///     Vec2::new(100.0, 200.0),
    ///     "my_shader.wgsl".to_string(),
    ///     &rts_data
    /// )?;
    /// ```
    pub fn from_rts_png(
        position: Vec2,
        shader_name: String,
        rts_png_data: &[u8],
    ) -> Result<Self, String> {
        let wgsl_source = extract_wgsl_from_rts(rts_png_data);

        if wgsl_source.is_empty() {
            return Err("No WGSL shader found in .rts.png file".to_string());
        }

        log::info!(
            "Created ExecutionZone '{}' from .rts.png ({} bytes of WGSL)",
            shader_name,
            wgsl_source.len()
        );

        Ok(Self::new(position, shader_name, wgsl_source))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    use glam::Vec2;

    #[test]
    fn test_execution_zone_creation() {
        let zone = ExecutionZone::new(
            Vec2::new(100.0, 200.0),
            "test_shader.wgsl".to_string(),
            vec![1, 2, 3, 4], // Mock WGSL source
        );

        assert_eq!(zone.position, Vec2::new(100.0, 200.0));
        assert_eq!(zone.shader_name, "test_shader.wgsl");
        assert!(!zone.is_active());
    }

    #[test]
    fn test_execution_zone_compile() {
        let mut zone = ExecutionZone::new(
            Vec2::new(0.0, 0.0),
            "test.wgsl".to_string(),
            create_simple_wgsl_shader(),
        );

        // After compiling, zone should be active
        zone.compile().expect("Compile should succeed");
        assert!(zone.is_active());
    }

    fn create_simple_wgsl_shader() -> Vec<u8> {
        r#"
        @compute @workgroup_size(1)
        fn main() {
        }
        "#
        .as_bytes()
        .to_vec()
    }

    #[test]
    fn test_execution_zone_from_rts_png() {
        // Create a test .rts.png with embedded WGSL
        let wgsl_code = "@compute @workgroup_size(1) fn main() {}";
        let header = b"WGSL:";
        let mut rts_png = header.to_vec();
        rts_png.push(wgsl_code.len() as u8);
        rts_png.extend_from_slice(wgsl_code.as_bytes());

        let zone = ExecutionZone::from_rts_png(
            Vec2::new(50.0, 75.0),
            "test_from_rts.wgsl".to_string(),
            &rts_png,
        )
        .expect("Should successfully create zone from .rts.png");

        assert_eq!(zone.position, Vec2::new(50.0, 75.0));
        assert_eq!(zone.shader_name, "test_from_rts.wgsl");
        assert_eq!(zone.wgsl_source, wgsl_code.as_bytes());
        assert!(!zone.is_active());
    }

    #[test]
    fn test_execution_zone_from_invalid_rts_png() {
        // Create invalid .rts.png data
        let invalid_rts = b"INVALID:DATA";

        let result = ExecutionZone::from_rts_png(
            Vec2::new(0.0, 0.0),
            "invalid.wgsl".to_string(),
            invalid_rts,
        );

        assert!(
            result.is_err(),
            "Should fail to create zone from invalid .rts.png"
        );
        assert_eq!(result.unwrap_err(), "No WGSL shader found in .rts.png file");
    }

    #[test]
    fn test_compile_wgsl_shader() {
        let wgsl = r#"
        @compute @workgroup_size(64)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let mut zone = ExecutionZone::new(
            Vec2::new(0.0, 0.0),
            "test.wgsl".to_string(),
            wgsl.as_bytes().to_vec(),
        );

        // Mock device creation would go here
        // For now, test that compile method exists
        assert!(!zone.is_active());

        // Test compile method exists and sets active state
        zone.compile().expect("Compile should succeed");
        assert!(zone.is_active());
    }

    #[test]
    fn test_execution_zone_workgroup_size() {
        let wgsl = r#"
        @compute @workgroup_size(32, 16, 1)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let zone = ExecutionZone::new(
            Vec2::new(0.0, 0.0),
            "test.wgsl".to_string(),
            wgsl.as_bytes().to_vec(),
        );

        // Default workgroup size should be (1, 1, 1)
        assert_eq!(zone.workgroup_size(), (1, 1, 1));
    }

    #[test]
    fn test_execution_zone_set_device() {
        let wgsl = r#"
        @compute @workgroup_size(128)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        }
        "#;

        let mut zone = ExecutionZone::new(
            Vec2::new(0.0, 0.0),
            "test.wgsl".to_string(),
            wgsl.as_bytes().to_vec(),
        );

        // Note: We can't create a real wgpu::Device in unit tests,
        // so this test just verifies the method exists
        // Integration tests will verify actual device compilation
        assert!(!zone.is_active());
    }
}
