// gpu_capabilities.rs
/// GPU capability detection for WGSL shader compatibility
use wgpu::Adapter;

/// Strategy for handling i64 operations in shaders
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum I64Strategy {
    /// Use native i64 support
    Native,
    /// Emulate i64 using i32 pairs
    Emulate,
}

/// GPU capability detection
#[derive(Debug, Clone)]
pub struct GpuCapabilities {
    pub supports_i64: bool,
    pub vendor_name: String,
    pub device_name: String,
}

impl GpuCapabilities {
    pub async fn new(adapter: &Adapter) -> Self {
        let info = adapter.get_info();

        // WGSL has very limited i64 support across GPU vendors
        // Rather than testing at runtime (which can crash), we assume emulation
        // Native i64 can be enabled via environment variable if needed
        let supports_i64 = std::env::var("PIXELRTS_ENABLE_NATIVE_I64")
            .ok()
            .and_then(|v| v.parse::<bool>().ok())
            .unwrap_or(false);

        Self {
            supports_i64,
            vendor_name: format!("{:?}", info.vendor),
            device_name: info.name.clone(),
        }
    }

    // Removed runtime test_i64_support - it was causing crashes
    // WGSL shader validation errors are treated as fatal by wgpu
    // Instead, we use emulation by default unless explicitly enabled

    pub fn get_i64_strategy(&self) -> I64Strategy {
        if self.supports_i64 {
            I64Strategy::Native
        } else {
            I64Strategy::Emulate
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_detect_i64_support() {
        let instance = wgpu::Instance::default();
        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions::default())
            .await
            .expect("Failed to find adapter");

        let caps = GpuCapabilities::new(&adapter).await;

        // Should at least detect something without crashing
        assert!(!caps.vendor_name.is_empty());
        println!("GPU: {} {}", caps.vendor_name, caps.device_name);
        println!("i64 supported: {}", caps.supports_i64);
        println!("i64 strategy: {:?}", caps.get_i64_strategy());

        // WGSL typically doesn't support i64, so we expect emulation
        // But test should pass regardless of the result
    }

    #[test]
    fn test_i64_emulation_fallback() {
        let caps = GpuCapabilities {
            supports_i64: false,
            vendor_name: "Test GPU".to_string(),
            device_name: "Test Device".to_string(),
        };

        assert_eq!(caps.get_i64_strategy(), I64Strategy::Emulate);
    }
}
