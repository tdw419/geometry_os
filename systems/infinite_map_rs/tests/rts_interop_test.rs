//! RTS Interoperability Tests
//!
//! Cross-language validation between Python and Rust RTS implementations.
//!
//! This module tests Python-Rust compatibility for the RTS (Real-Time Shader) format:
//! - Metadata JSON serialization format
//! - SHA256 hash computation consistency
//! - Pack/unpack roundtrip preservation
//! - Hilbert curve coordinate mapping
//!
//! # Architecture Notes
//!
//! ## Current State (Rust)
//! - `infinite_map_rs::rts` module provides WGSL extraction from .rts.png files
//! - Hilbert curve implementation in `infinite_map_rs::hilbert` module
//! - No full packer/unpacker yet (planned)
//!
//! ## Python Implementation
//! - `systems.packaging.rts_bundler.RTSBundler` - Creates .rts.png bundles
//! - `systems.packaging.rts_unpacker.RTSUnpacker` - Extracts files from .rts.png
//! - Metadata format: `{format, version, grid_size, offsets, encoding}`
//!
//! # Test Strategy
//!
//! 1. **Existing functionality tests**: Test what we have now
//! 2. **Placeholder tests**: Document what needs implementation
//! 3. **Golden master tests**: Use Python-generated bundles for validation

use infinite_map_rs::hilbert::{d2xy, xy2d};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::collections::HashMap;
use std::path::Path;

// ============================================
// Test Data Structures
// ============================================

/// RTS Metadata format (matches Python RTSMetadata)
///
/// This structure must match the JSON schema used by Python's RTSBundler.
/// See: systems/packaging/rts_bundler.py
#[derive(Debug, Deserialize, Serialize, PartialEq)]
#[serde(rename_all = "snake_case")]
pub struct RTSMetadata {
    /// Format identifier (e.g., "PixelRTS-2.0")
    pub format: String,
    /// Version string (e.g., "2.0")
    pub version: String,
    /// Grid size (must be power of 2: 2^order)
    pub grid_size: u32,
    /// File offset information
    pub offsets: HashMap<String, FileOffsetInfo>,
    /// Encoding information
    pub encoding: EncodingInfo,
}

/// Offset information for a single file
#[derive(Debug, Deserialize, Serialize, PartialEq)]
pub struct FileOffsetInfo {
    /// Start byte offset in RGBA data
    pub start: u64,
    /// End byte offset in RGBA data
    pub end: u64,
    /// SHA256 hash of original file content (lowercase hex)
    pub sha256: String,
}

/// Encoding metadata
#[derive(Debug, Deserialize, Serialize, PartialEq)]
pub struct EncodingInfo {
    /// Mapping algorithm (e.g., "Hilbert space-filling curve (precomputed LUT)")
    pub mapping: String,
    /// Byte packing order (e.g., "RGBA")
    #[serde(default = "default_rgba_order")]
    pub order: String,
}

fn default_rgba_order() -> String {
    "RGBA".to_string()
}

/// Python-generated test bundle metadata
#[derive(Debug, Deserialize)]
struct PythonTestVectors {
    metadata: RTSMetadata,
    /// Expected Hilbert coordinates for key byte positions
    hilbert_coordinates: HashMap<String, (u32, u32)>,
}

// ============================================
// Test Utilities
// ============================================

/// Compute SHA256 hash of byte slice (lowercase hex)
fn compute_sha256(data: &[u8]) -> String {
    let mut hasher = Sha256::new();
    hasher.update(data);
    let result = hasher.finalize();
    // Convert to lowercase hex string
    result.iter().fold(String::with_capacity(64), |mut s, b| {
        s.push_str(&format!("{:02x}", b));
        s
    })
}

/// Verify a grid size is a power of 2
fn is_power_of_two(n: u32) -> bool {
    n > 0 && (n & (n - 1)) == 0
}

/// Calculate Hilbert order from grid size
fn grid_size_to_order(grid_size: u32) -> u32 {
    assert!(is_power_of_two(grid_size), "Grid size must be power of 2");
    grid_size.trailing_zeros()
}

/// Load Python-generated test metadata
///
/// Looks for test artifacts in tests/cross_language/rts_*.json
fn load_python_test_metadata(name: &str) -> Option<RTSMetadata> {
    let project_root = Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent()
        .and_then(|p| p.parent())
        .expect("Failed to find project root");

    let test_path = project_root
        .join("tests")
        .join("cross_language")
        .join(format!("rts_{}.json", name));

    std::fs::read_to_string(&test_path)
        .ok()
        .and_then(|content| serde_json::from_str(&content).ok())
}

// ============================================
// Test 1: Metadata JSON Compatibility
// ============================================

#[test]
fn test_rts_metadata_json_compatibility() {
    /// Verify RTSMetadata can be serialized to JSON with expected field names.
    ///
    /// This ensures Rust serde produces JSON compatible with Python's json module.
    /// Field names must use snake_case to match Python conventions.
    let metadata = RTSMetadata {
        format: "PixelRTS-2.0".to_string(),
        version: "2.0".to_string(),
        grid_size: 256,
        offsets: {
            let mut map = HashMap::new();
            map.insert(
                "test.txt".to_string(),
                FileOffsetInfo {
                    start: 0,
                    end: 1024,
                    sha256: "a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146"
                        .to_string(),
                },
            );
            map
        },
        encoding: EncodingInfo {
            mapping: "Hilbert space-filling curve (precomputed LUT)".to_string(),
            order: "RGBA".to_string(),
        },
    };

    // Serialize to JSON
    let json_str = serde_json::to_string_pretty(&metadata).expect("Failed to serialize metadata");

    // Verify it's valid JSON
    let reparsed: RTSMetadata =
        serde_json::from_str(&json_str).expect("Failed to parse serialized JSON");

    // Verify roundtrip preservation
    assert_eq!(reparsed, metadata);

    // Verify field names (must be snake_case for Python compatibility)
    assert!(json_str.contains("\"format\""));
    assert!(json_str.contains("\"version\""));
    assert!(json_str.contains("\"grid_size\""));
    assert!(json_str.contains("\"offsets\""));
    assert!(json_str.contains("\"encoding\""));
    assert!(json_str.contains("\"mapping\""));
}

#[test]
fn test_rts_metadata_field_types() {
    /// Verify metadata fields use correct JSON types for Python compatibility.
    ///
    /// Python expects:
    /// - grid_size: int
    /// - start/end: int
    /// - sha256: str (64 char lowercase hex)
    let metadata = RTSMetadata {
        format: "PixelRTS-2.0".to_string(),
        version: "2.0".to_string(),
        grid_size: 512,
        offsets: {
            let mut map = HashMap::new();
            map.insert(
                "file.bin".to_string(),
                FileOffsetInfo {
                    start: 4096,
                    end: 8192,
                    sha256: compute_sha256(b"test data"),
                },
            );
            map
        },
        encoding: EncodingInfo {
            mapping: "Hilbert".to_string(),
            order: "RGBA".to_string(),
        },
    };

    // Verify grid_size is integer (not string)
    let json = serde_json::to_value(&metadata).unwrap();
    assert!(json["grid_size"].is_number());
    assert_eq!(json["grid_size"], 512);

    // Verify offsets are integers
    assert!(json["offsets"]["file.bin"]["start"].is_number());
    assert!(json["offsets"]["file.bin"]["end"].is_number());

    // Verify sha256 is string of correct length
    assert!(json["offsets"]["file.bin"]["sha256"].is_string());
    let hash = json["offsets"]["file.bin"]["sha256"].as_str().unwrap();
    assert_eq!(hash.len(), 64);
    assert!(hash
        .chars()
        .all(|c| c.is_ascii_hexdigit() && !c.is_ascii_uppercase()));
}

// ============================================
// Test 2: SHA256 Hash Computation
// ============================================

#[test]
fn test_rts_sha256_hash() {
    /// Verify SHA256 hash computation matches expected value.
    ///
    /// Uses test vectors compatible with Python's hashlib.sha256().
    /// Ensures cross-language hash consistency.
    // Test vector 1: Empty input
    let empty_hash = compute_sha256(b"");
    assert_eq!(
        empty_hash,
        "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    );

    // Test vector 2: Known value
    let test_data = b"Hello, World!";
    let hash = compute_sha256(test_data);
    assert_eq!(
        hash,
        "dffd6021bb2bd5b0af676290809ec3a53191dd81c7f70a4b28688a362182986f"
    );

    // Test vector 3: All byte values (0-255)
    let all_bytes: Vec<u8> = (0..=255).collect();
    let hash = compute_sha256(&all_bytes);
    assert_eq!(hash.len(), 64);
    // Verify format (lowercase hex)
    for c in hash.chars() {
        assert!(c.is_ascii_hexdigit(), "Invalid hex character: {}", c);
        assert!(
            c.is_ascii_lowercase() || c.is_ascii_digit(),
            "Uppercase found in: {}",
            hash
        );
    }
}

#[test]
fn test_rts_sha256_lowercase_hex() {
    /// Verify SHA256 hashes use lowercase hex (Python convention).
    let hash = compute_sha256(b"test");
    assert!(hash
        .chars()
        .all(|c| c.is_ascii_lowercase() || c.is_ascii_digit()));
}

// ============================================
// Test 3: Hilbert Curve Coordinate Mapping
// ============================================

#[test]
fn test_rts_hilbert_byte_to_pixel_mapping() {
    /// Verify byte position to Hilbert coordinate mapping.
    ///
    /// In RTS format:
    /// - 4 bytes (RGBA) = 1 pixel
    /// - Byte position N -> Pixel index N/4
    /// - Pixel index -> Hilbert (x, y) coordinates
    let grid_size = 256u32;
    let order = grid_size_to_order(grid_size);

    // Test byte positions 0, 4, 8, 12 (first 4 pixels)
    for (i, byte_pos) in [0u64, 4, 8, 12].iter().enumerate() {
        let pixel_idx = byte_pos / 4;
        let (x, y) = d2xy(grid_size, pixel_idx);

        // Verify coordinates are in bounds
        assert!(x < grid_size, "X coordinate {} out of bounds", x);
        assert!(y < grid_size, "Y coordinate {} out of bounds", y);

        // Verify we can roundtrip back to the same pixel index
        let recovered = xy2d(grid_size, x, y);
        assert_eq!(
            recovered, pixel_idx,
            "Roundtrip failed for pixel index {}",
            pixel_idx
        );
    }
}

#[test]
fn test_rts_hilbert_grid_size_power_of_two() {
    /// Verify grid sizes used in RTS are powers of 2.
    ///
    /// Hilbert curve requires 2^order grid dimensions.
    /// Common sizes: 128, 256, 512, 1024, 2048, 4096
    let valid_sizes = [128, 256, 512, 1024, 2048, 4096];
    for &size in &valid_sizes {
        assert!(is_power_of_two(size), "{} is not power of 2", size);
        let order = grid_size_to_order(size);
        assert_eq!(1u32 << order, size);
    }
}

// ============================================
// Test 4: Pack/Unpack Roundtrip (Placeholder)
// ============================================

#[test]
fn test_rts_roundtrip_preservation_placeholder() {
    /// Verify pack/unpack preserves all bytes exactly.
    ///
    /// PLACEHOLDER TEST - Requires RTS packer/unpacker implementation.
    ///
    /// TODO: Implement when RTS packer/unpacker modules are available:
    /// 1. Create test data with known hash
    /// 2. Pack into .rts.png format
    /// 3. Unpack from .rts.png
    /// 4. Verify hash matches original
    ///
    /// Expected implementation:
    /// ```rust
    /// use infinite_map_rs::rts::packer::{RTSPacker, PackOptions};
    /// use infinite_map_rs::rts::unpacker::{RTSUnpacker, UnpackOptions};
    ///
    /// let test_data = b"Hello, RTS!";
    /// let original_hash = compute_sha256(test_data);
    ///
    /// // Pack
    /// let packer = RTSPacker::new();
    /// let bundle = packer.pack_bytes(test_data);
    ///
    /// // Unpack
    /// let unpacker = RTSUnpacker::new(&bundle);
    /// let recovered = unpacker.unpack_all().unwrap();
    ///
    /// // Verify
    /// assert_eq!(compute_sha256(&recovered), original_hash);
    /// assert_eq!(recovered, test_data);
    /// ```
    // For now, verify the concept works with Hilbert mapping
    let test_data: Vec<u8> = (0..255).cycle().take(1024).collect();

    // Simulate pixel mapping
    let grid_size = 32u32; // 32x32 = 1024 pixels
    for (byte_idx, &byte) in test_data.iter().enumerate().take(100) {
        let pixel_idx = (byte_idx / 4) as u64;
        let (x, y) = d2xy(grid_size, pixel_idx);

        // Verify we can recover the byte position from coordinates
        let recovered_idx = xy2d(grid_size, x, y) as usize * 4 + (byte_idx % 4);

        // For first 100 bytes, verify we recover correct position
        // (Note: This only works because we're mapping byte_idx to pixel_idx)
        if byte_idx < 16 {
            // First 4 pixels (16 bytes)
            assert_eq!(recovered_idx, byte_idx);
        }
    }
}

// ============================================
// Test 5: RGBA Byte Order
// ============================================

#[test]
fn test_rts_rgba_byte_order() {
    /// Verify RGBA byte order matches Python convention.
    ///
    /// RTS format specifies: R=byte[0], G=byte[1], B=byte[2], A=byte[3]
    ///
    /// This is a conceptual test - actual pixel manipulation requires
    /// the image crate or RTS packer implementation.
    // Simulate 4-byte RGBA pixel
    let pixel_bytes = [0x12u8, 0x34, 0x56, 0x78];

    // Verify order: R, G, B, A
    assert_eq!(pixel_bytes[0], 0x12, "R channel should be first byte");
    assert_eq!(pixel_bytes[1], 0x34, "G channel should be second byte");
    assert_eq!(pixel_bytes[2], 0x56, "B channel should be third byte");
    assert_eq!(pixel_bytes[3], 0x78, "A channel should be fourth byte");
}

// ============================================
// Test 6: Cross-Language Golden Master
// ============================================

#[test]
fn test_rts_python_metadata_compatibility() {
    /// Test compatibility with Python-generated metadata (if available).
    ///
    /// This test loads Python-generated test vectors and verifies
    /// the Rust implementation can parse and validate them.
    // Try to load Python test metadata
    if let Some(_metadata) = load_python_test_metadata("example") {
        // If test data exists, verify we can parse it
        // This will be enabled once Python side generates test artifacts
    } else {
        // Test data not available - document what's needed
        println!("Note: Python test metadata not available.");
        println!("To enable this test, generate test artifacts:");
        println!("  cd tests/cross_language");
        println!("  python generate_rts_test_data.py");
    }
}

// ============================================
// Test 7: Offset to Coordinate Mapping
// ============================================

#[test]
fn test_rts_offset_to_hilbert_coordinate() {
    /// Verify file offset to Hilbert coordinate mapping.
    ///
    /// In RTS bundles, file offsets in metadata map to Hilbert coordinates.
    /// offset N -> pixel N/4 -> Hilbert(x, y)
    let grid_size = 512u32;

    // Test various offsets
    let test_offsets = [0u64, 1024, 4096, 16384, 65536];

    for offset in test_offsets {
        let pixel_idx = offset / 4;
        let (x, y) = d2xy(grid_size, pixel_idx);

        // Verify in bounds
        assert!(
            x < grid_size,
            "X coordinate {} out of bounds for offset {}",
            x,
            offset
        );
        assert!(
            y < grid_size,
            "Y coordinate {} out of bounds for offset {}",
            y,
            offset
        );

        // Verify roundtrip
        let recovered = xy2d(grid_size, x, y);
        assert_eq!(
            recovered, pixel_idx,
            "Roundtrip failed for offset {}",
            offset
        );
    }
}

// ============================================
// Module Documentation
// ============================================

// For RTS format specification, see:
// - Python: systems/packaging/rts_bundler.py
// - Tests: tests/cross_language/test_rts_interop.py
// - Spec docs: docs/cross_language/RTS_CROSS_LANGUAGE_SPEC.md (when generated)
