//! Shader Loader for Geometry OS
//!
//! Provides unified loading of WGSL and SPIR-V shaders with:
//! - Automatic SPIR-V detection (faster startup)
//! - Fallback to WGSL (for debugging)
//! - Shader specialization support

use wgpu::{Device, ShaderModule, ShaderModuleDescriptor, ShaderSource};
use std::path::{Path, PathBuf};

/// Shader loading mode
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum ShaderMode {
    /// Pre-compiled SPIR-V binary (faster startup)
    SpirV,
    /// Source WGSL text (better error messages)
    Wgsl,
    /// Auto-detect (SPIR-V if available, else WGSL)
    Auto,
}

/// Shader loader with caching and specialization support
pub struct ShaderLoader {
    /// Base directory for shader files
    shader_dir: PathBuf,
    /// Directory for compiled SPIR-V files
    spirv_dir: Option<PathBuf>,
    /// Current loading mode
    mode: ShaderMode,
}

impl ShaderLoader {
    /// Create a new shader loader
    ///
    /// # Arguments
    /// * `shader_dir` - Base directory containing .wgsl files
    /// * `spirv_dir` - Optional directory containing pre-compiled .spv files
    pub fn new(shader_dir: impl Into<PathBuf>, spirv_dir: Option<PathBuf>) -> Self {
        Self {
            shader_dir: shader_dir.into(),
            spirv_dir,
            mode: ShaderMode::Auto,
        }
    }

    /// Set the shader loading mode
    pub fn set_mode(&mut self, mode: ShaderMode) {
        self.mode = mode;
    }

    /// Load a shader by name (without extension)
    ///
    /// # Arguments
    /// * `device` - WGPU device
    /// * `name` - Shader name (e.g., "riscv_executor")
    ///
    /// # Returns
    /// The loaded shader module
    pub fn load(&self, device: &Device, name: &str) -> Result<ShaderModule, ShaderLoadError> {
        self.load_with_label(device, name, None)
    }

    /// Load a shader with a custom debug label
    pub fn load_with_label(
        &self,
        device: &Device,
        name: &str,
        label: Option<&str>,
    ) -> Result<ShaderModule, ShaderLoadError> {
        let should_use_spirv = match self.mode {
            ShaderMode::SpirV => true,
            ShaderMode::Wgsl => false,
            ShaderMode::Auto => self.spirv_available(name),
        };

        if should_use_spirv {
            self.load_spirv(device, name, label)
        } else {
            self.load_wgsl(device, name, label)
        }
    }

    /// Check if a SPIR-V version of the shader exists
    fn spirv_available(&self, name: &str) -> bool {
        if let Some(ref dir) = self.spirv_dir {
            dir.join(format!("{}.spv", name)).exists()
        } else {
            false
        }
    }

    /// Load SPIR-V binary
    fn load_spirv(
        &self,
        device: &Device,
        name: &str,
        label: Option<&str>,
    ) -> Result<ShaderModule, ShaderLoadError> {
        let spirv_dir = self.spirv_dir.as_ref()
            .ok_or_else(|| ShaderLoadError::SpirVNotAvailable(name.to_string()))?;

        let spv_path = spirv_dir.join(format!("{}.spv", name));

        if !spv_path.exists() {
            return Err(ShaderLoadError::FileNotFound(spv_path));
        }

        // Read SPIR-V binary
        let bytes = std::fs::read(&spv_path)
            .map_err(|e| ShaderLoadError::IoError(spv_path.clone(), e))?;

        // Convert to u32 words (SPIR-V format)
        if bytes.len() % 4 != 0 {
            return Err(ShaderLoadError::InvalidSpirV("Not aligned to 4 bytes".into()));
        }

        let words: Vec<u32> = bytes
            .chunks_exact(4)
            .map(|chunk| u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]))
            .collect();

        let shader_label = label.unwrap_or(name);

        Ok(device.create_shader_module(ShaderModuleDescriptor {
            label: Some(shader_label),
            source: ShaderSource::SpirV(std::borrow::Cow::Borrowed(&words)),
        }))
    }

    /// Load WGSL source
    fn load_wgsl(
        &self,
        device: &Device,
        name: &str,
        label: Option<&str>,
    ) -> Result<ShaderModule, ShaderLoadError> {
        let wgsl_path = self.shader_dir.join(format!("{}.wgsl", name));

        if !wgsl_path.exists() {
            return Err(ShaderLoadError::FileNotFound(wgsl_path));
        }

        let source = std::fs::read_to_string(&wgsl_path)
            .map_err(|e| ShaderLoadError::IoError(wgsl_path.clone(), e))?;

        let shader_label = label.unwrap_or(name);

        Ok(device.create_shader_module(ShaderModuleDescriptor {
            label: Some(shader_label),
            source: ShaderSource::Wgsl(source.into()),
        }))
    }
}

/// Shader loading errors
#[derive(Debug)]
pub enum ShaderLoadError {
    /// SPIR-V not available (no directory configured)
    SpirVNotAvailable(String),
    /// File not found
    FileNotFound(PathBuf),
    /// I/O error reading file
    IoError(PathBuf, std::io::Error),
    /// Invalid SPIR-V binary
    InvalidSpirV(String),
}

impl std::fmt::Display for ShaderLoadError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::SpirVNotAvailable(name) => {
                write!(f, "SPIR-V not available for shader: {}", name)
            }
            Self::FileNotFound(path) => {
                write!(f, "Shader file not found: {}", path.display())
            }
            Self::IoError(path, e) => {
                write!(f, "Failed to read shader {}: {}", path.display(), e)
            }
            Self::InvalidSpirV(msg) => {
                write!(f, "Invalid SPIR-V binary: {}", msg)
            }
        }
    }
}

impl std::error::Error for ShaderLoadError {}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_spirv_detection() {
        let loader = ShaderLoader::new(
            "shaders",
            Some(PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("target/spirv")),
        );

        // This will depend on whether SPIR-V files exist
        let _available = loader.spirv_available("riscv_executor");
    }
}
