//! Screen Dimensions Configuration
//!
//! Configuration for screen/display dimensions in bare metal rendering mode.

/// Configuration for screen dimensions
///
/// Default is 1920x1080 (Full HD)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct ScreenDimensionsConfig {
    /// Screen width in pixels
    pub width: u32,
    /// Screen height in pixels
    pub height: u32,
}

impl Default for ScreenDimensionsConfig {
    fn default() -> Self {
        Self {
            width: 1920,
            height: 1080,
        }
    }
}

impl ScreenDimensionsConfig {
    /// Create a new screen dimensions config with custom dimensions
    pub fn new(width: u32, height: u32) -> Self {
        Self { width, height }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_default_dimensions() {
        let config = ScreenDimensionsConfig::default();
        assert_eq!(config.width, 1920);
        assert_eq!(config.height, 1080);
    }

    #[test]
    fn test_custom_dimensions() {
        let config = ScreenDimensionsConfig::new(800, 600);
        assert_eq!(config.width, 800);
        assert_eq!(config.height, 600);
    }
}
