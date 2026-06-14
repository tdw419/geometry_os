//! WGSL Extraction Tests for .rts.png files
//!
//! Test-driven development for WGSL shader extraction from .rts.png format.
//! Tests must fail initially, then pass after implementation.

#[cfg(test)]
mod tests {
    use crate::rts::extractor::*;

    /// Test basic WGSL extraction from .rts.png with embedded tEXt chunk
    #[test]
    fn test_extract_wgsl_from_rts() {
        // Create a test .rts.png with embedded WGSL
        let wgsl_code = "@compute @workgroup_size(1) fn main() {}";
        let rts_png = create_wgsl_rts_png(wgsl_code);

        let extracted = extract_wgsl_from_rts(&rts_png);
        assert_eq!(extracted, wgsl_code.as_bytes());
    }

    /// Test that extraction fails for non-WGSL .rts.png files
    #[test]
    fn test_extract_wgsl_from_non_wgsl_rts() {
        // Create a .rts.png without WGSL metadata
        let rts_png = create_non_wgsl_rts_png();

        let result = extract_wgsl_from_rts(&rts_png);
        assert!(result.is_empty());
    }

    /// Test extraction from alpha channel with blue-purple WGSL indicator
    #[test]
    fn test_extract_wgsl_from_alpha_channel() {
        // Create a .rts.png with blue-purple color indicating WGSL
        let wgsl_code = "@compute @workgroup_size(1) fn main() { var x: u32 = 42; }";
        let rts_png = create_wgsl_alpha_rts_png(wgsl_code);

        let extracted = extract_wgsl_from_rts(&rts_png);
        assert!(!extracted.is_empty());
        assert!(extracted.len() >= wgsl_code.len());
    }

    /// Test Hilbert curve decoding fallback
    #[test]
    fn test_extract_wgsl_via_hilbert_curve() {
        // Create a .rts.png with WGSL encoded via Hilbert curve
        let wgsl_code = "@compute @workgroup_size(1) fn main() {}";
        let rts_png = create_hilbert_wgsl_rts_png(wgsl_code);

        let extracted = extract_wgsl_from_rts(&rts_png);
        assert!(!extracted.is_empty());
    }

    // Helper functions for test data creation

    /// Create a simplified .rts.png with WGSL metadata in tEXt chunk
    fn create_wgsl_rts_png(wgsl: &str) -> Vec<u8> {
        // Simplified .rts.png creation for testing
        // Format: "WGSL:<length>:<data>"
        let header = b"WGSL:";
        let len = wgsl.len() as u8;
        let mut result = header.to_vec();
        result.push(len);
        result.extend_from_slice(wgsl.as_bytes());
        result
    }

    /// Create a .rts.png without WGSL metadata
    fn create_non_wgsl_rts_png() -> Vec<u8> {
        b"PNG:NOWGSL".to_vec()
    }

    /// Create a .rts.png with blue-purple WGSL indicator in alpha channel
    fn create_wgsl_alpha_rts_png(wgsl: &str) -> Vec<u8> {
        // Format: "ALPHA:WGSL:<length>:<data>"
        let header = b"ALPHA:WGSL:";
        let len = wgsl.len() as u8;
        let mut result = header.to_vec();
        result.push(len);
        result.extend_from_slice(wgsl.as_bytes());
        result
    }

    /// Create a .rts.png with WGSL encoded via Hilbert curve
    fn create_hilbert_wgsl_rts_png(wgsl: &str) -> Vec<u8> {
        // Format: "HILBERT:<length>:<data>"
        let header = b"HILBERT:";
        let len = wgsl.len() as u8;
        let mut result = header.to_vec();
        result.push(len);
        result.extend_from_slice(wgsl.as_bytes());
        result
    }

    /// Test color detection for WGSL shaders (low R < 100, high B > 150)
    #[test]
    fn test_wgsl_color_detection() {
        // Blue-purple: low R (< 100), high B (> 150)
        let is_wgsl = is_wgsl_color(10, 100, 240);
        assert!(is_wgsl, "R=10 < 100, B=240 > 150 should indicate WGSL");

        let is_wgsl = is_wgsl_color(99, 0, 151);
        assert!(is_wgsl, "R=99 < 100, B=151 > 150 should indicate WGSL");

        let is_wgsl = is_wgsl_color(50, 200, 200);
        assert!(is_wgsl, "R=50 < 100, B=200 > 150 should indicate WGSL");

        // Boundary cases (should NOT be WGSL)
        let is_wgsl = is_wgsl_color(100, 100, 200);
        assert!(!is_wgsl, "R=100 is not < 100 (boundary case)");

        let is_wgsl = is_wgsl_color(10, 100, 150);
        assert!(!is_wgsl, "B=150 is not > 150 (boundary case)");

        // Regular colors should not be detected as WGSL
        let is_wgsl = is_wgsl_color(200, 100, 50);
        assert!(
            !is_wgsl,
            "Red-orange (R=200 > 100, B=50 < 150) should not indicate WGSL"
        );

        let is_wgsl = is_wgsl_color(128, 128, 128);
        assert!(
            !is_wgsl,
            "Gray (R=128 > 100, B=128 < 150) should not indicate WGSL"
        );
    }

    /// Test parsing WGSL from PNG tEXt chunk metadata
    #[test]
    fn test_parse_wgsl_from_text_chunk() {
        let metadata = "type:wgsl-shader";
        assert!(is_wgsl_metadata(metadata));

        let metadata = "type:binary";
        assert!(!is_wgsl_metadata(metadata));
    }
}
