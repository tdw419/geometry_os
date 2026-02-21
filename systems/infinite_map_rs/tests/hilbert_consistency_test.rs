//! Hilbert Curve Consistency Tests
//!
//! Cross-language validation between Python and Rust Hilbert implementations.
//! Ensures both languages produce identical coordinates for the same indices.
//!
//! ## Test Coverage
//!
//! 1. **Roundtrip Consistency** - Verify d2xy and xy2d are inverses
//! 2. **Locality Property** - Verify consecutive indices have Manhattan distance = 1
//! 3. **Python Test Vector Compatibility** - Verify against reference Python vectors
//! 4. **HilbertCurve Struct** - Verify struct produces same results as direct functions
//! 5. **Coordinate Uniqueness** - Verify each index produces a unique coordinate

use infinite_map_rs::hilbert::{d2xy, xy2d, HilbertCurve};

// ============================================
// Test Vectors from Python hilbert_reference.py
// ============================================

/// Test vector: (n, d, expected_x, expected_y)
const PYTHON_TEST_VECTORS: &[(u32, u64, u32, u32)] = &[
    // Order 1 (2x2 grid) - Basic pattern
    (2, 0, 0, 0),
    (2, 1, 0, 1),
    (2, 2, 1, 1),
    (2, 3, 1, 0),
    // Order 2 (4x4 grid) - Extended pattern
    (4, 0, 0, 0),
    (4, 1, 1, 0),
    (4, 2, 1, 1),
    (4, 3, 0, 1),
    // Order 3 (8x8 grid) - Extended pattern
    (8, 0, 0, 0),
    (8, 7, 2, 1),
    (8, 15, 0, 3),
    // Order 4 (16x16 grid) - Edge cases
    (16, 0, 0, 0),
    (16, 255, 15, 0),
    // Order 6 (64x64 grid) - Far corner
    (64, 0, 0, 0),
    (64, 4095, 63, 0),
    // Order 7 (128x128 grid) - Far corner
    (128, 0, 0, 0),
    (128, 16383, 127, 0),
];

// ============================================
// Test 1: Roundtrip Consistency
// ============================================
#[test]
fn test_hilbert_roundtrip() {
    /// Verify d2xy and xy2d are inverses for n=2^order where order=1..7
    for order in 1..=7 {
        let n = 1u32 << order; // 2, 4, 8, 16, 32, 64, 128

        for d in 0..(n * n) {
            let d = d as u64;
            let (x, y) = d2xy(n, d);
            let d2 = xy2d(n, x, y);

            assert_eq!(
                d2, d,
                "Roundtrip failed for n={} (order={}): d={} -> ({},{}) -> {}",
                n, order, d, x, y, d2
            );
        }
    }
}

// ============================================
// Test 2: Locality Property
// ============================================
#[test]
fn test_hilbert_locality() {
    /// Verify consecutive indices have Manhattan distance = 1
    for order in 1..=7 {
        let n = 1u32 << order;
        let total = (n * n) as u64;

        for d in 0..(total - 1) {
            let (x1, y1) = d2xy(n, d);
            let (x2, y2) = d2xy(n, d + 1);

            // Manhattan distance should be exactly 1 for adjacent points
            let dist = (x1 as i32 - x2 as i32).abs() + (y1 as i32 - y2 as i32).abs();

            assert_eq!(
                dist,
                1,
                "Non-adjacent points for n={} (order={}): d={} -> ({},{}), d={} -> ({},{})",
                n,
                order,
                d,
                x1,
                y1,
                d + 1,
                x2,
                y2
            );
        }
    }
}

// ============================================
// Test 3: Python Test Vector Compatibility
// ============================================
#[test]
fn test_hilbert_python_vectors() {
    /// Verify Rust implementation matches Python reference implementation
    for &(n, d, expected_x, expected_y) in PYTHON_TEST_VECTORS {
        let (x, y) = d2xy(n, d);

        assert_eq!(
            (x, y),
            (expected_x, expected_y),
            "Python vector mismatch for n={}, d={}: got ({}, {}), expected ({}, {})",
            n,
            d,
            x,
            y,
            expected_x,
            expected_y
        );

        // Also verify the inverse
        let d2 = xy2d(n, expected_x, expected_y);
        assert_eq!(
            d2, d,
            "Inverse mismatch: n=({}, {}, {}): got {}, expected {}",
            n, expected_x, expected_y, d2, d
        );
    }

    println!(
        "Validated {} Python test vectors",
        PYTHON_TEST_VECTORS.len()
    );
}

// ============================================
// Test 4: HilbertCurve Struct Consistency
// ============================================
#[test]
fn test_hilbert_curve_struct_consistency() {
    /// Verify HilbertCurve struct produces same results as direct functions
    for order in 1..=7 {
        let curve = HilbertCurve::from_order(order);
        let n = curve.n;

        assert_eq!(n, 1u32 << order);
        assert_eq!(curve.order, order);
        assert_eq!(curve.total_pixels, (n * n) as u64);

        // Test a sampling of indices (full test would be too slow)
        let sample_size = curve.total_pixels.min(1000);
        for d in 0..sample_size {
            let direct = d2xy(n, d);
            let struct_result = curve.d2xy(d);

            assert_eq!(
                direct, struct_result,
                "HilbertCurve.d2xy mismatch with d2xy at n={}, d={}",
                n, d
            );

            // Also test xy2d
            let (x, y) = direct;
            let direct_d = xy2d(n, x, y);
            let struct_d = curve.xy2d(x, y);

            assert_eq!(
                direct_d, struct_d,
                "HilbertCurve.xy2d mismatch with xy2d at n=({}, {})",
                x, y
            );
        }
    }
}

// ============================================
// Test 5: Coordinate Uniqueness
// ============================================
#[test]
fn test_hilbert_coordinate_uniqueness() {
    /// Verify each index produces a unique coordinate
    for order in 1..=6 {
        let n = 1u32 << order;
        let total = (n * n) as usize;
        let mut seen = std::collections::HashSet::new();

        for d in 0..total as u64 {
            let (x, y) = d2xy(n, d);
            let coord = (x, y);

            assert!(
                seen.insert(coord),
                "Duplicate coordinate ({}, {}) at index {} for n={}",
                x,
                y,
                d,
                n
            );

            assert!(x < n, "X coordinate {} out of bounds for n={}", x, n);
            assert!(y < n, "Y coordinate {} out of bounds for n={}", y, n);
        }

        assert_eq!(
            seen.len(),
            total,
            "Missing coordinates for n={} (expected {}, found {})",
            n,
            total,
            seen.len()
        );
    }
}

// ============================================
// Test 6: Specific Test Vectors
// ============================================
#[test]
fn test_hilbert_specific_vectors() {
    /// Test against known good vectors from the reference implementation
    /// These verify the Hilbert curve produces correct spatial locality

    // Order 1 (2x2 grid) - Verify basic pattern
    assert_eq!(d2xy(2, 0), (0, 0), "Order 1, index 0");
    assert_eq!(d2xy(2, 1), (0, 1), "Order 1, index 1");
    assert_eq!(d2xy(2, 2), (1, 1), "Order 1, index 2");
    assert_eq!(d2xy(2, 3), (1, 0), "Order 1, index 3");

    // Order 2 (4x4 grid) - Spot check key transitions
    assert_eq!(d2xy(4, 0), (0, 0), "Order 2, index 0 (origin)");
    assert_eq!(d2xy(4, 3), (0, 1), "Order 2, index 3 (first quad end)");
    assert_eq!(d2xy(4, 4), (0, 2), "Order 2, index 4 (second quad start)");
    assert_eq!(d2xy(4, 15), (3, 0), "Order 2, index 15 (last)");

    // Order 3 (8x8 grid) - Verify locality at transitions
    let (x0, y0) = d2xy(8, 0);
    let (x1, y1) = d2xy(8, 1);
    let dist = (x0 as i32 - x1 as i32).abs() + (y0 as i32 - y1 as i32).abs();
    assert_eq!(dist, 1, "Adjacent points should have Manhattan distance 1");
}

// ============================================
// Test 7: LUT Generation
// ============================================
#[test]
fn test_hilbert_lut_generation() {
    /// Verify lookup table generation produces correct results
    let curve = HilbertCurve::new(8);

    // Test regular LUT
    let lut = curve.generate_lut();
    assert_eq!(lut.len(), 64, "LUT should have 64 entries for 8x8 grid");

    // Verify first few entries
    assert_eq!(lut[0], (0, 0), "LUT[0] should be (0, 0)");
    assert_eq!(lut[1], (0, 1), "LUT[1] should be (0, 1)");
    assert_eq!(lut[2], (1, 1), "LUT[2] should be (1, 1)");

    // Test GPU LUT
    let gpu_lut = curve.generate_gpu_lut();
    assert_eq!(
        gpu_lut.len(),
        128,
        "GPU LUT should have 128 entries (64 * 2) for 8x8 grid"
    );
    assert_eq!(gpu_lut[0], 0, "GPU_LUT[0] (x) should be 0");
    assert_eq!(gpu_lut[1], 0, "GPU_LUT[1] (y) should be 0");
    assert_eq!(gpu_lut[2], 0, "GPU_LUT[2] (x) should be 0");
    assert_eq!(gpu_lut[3], 1, "GPU_LUT[3] (y) should be 1");

    // Verify GPU LUT matches regular LUT
    for i in 0..64 {
        let (x, y) = lut[i];
        assert_eq!(
            gpu_lut[i * 2],
            x,
            "GPU_LUT x coordinate mismatch at index {}",
            i
        );
        assert_eq!(
            gpu_lut[i * 2 + 1],
            y,
            "GPU_LUT y coordinate mismatch at index {}",
            i
        );
    }
}

// ============================================
// Test 8: Helper Functions
// ============================================
#[test]
fn test_hilbert_helper_functions() {
    /// Test utility functions for grid validation
    use infinite_map_rs::hilbert::{grid_capacity, grid_order, validate_grid_size};

    // Test validate_grid_size (1 is a power of 2, so it's valid)
    assert!(validate_grid_size(1));
    assert!(validate_grid_size(2));
    assert!(validate_grid_size(4));
    assert!(validate_grid_size(8));
    assert!(validate_grid_size(16));
    assert!(validate_grid_size(256));
    assert!(validate_grid_size(1024));
    assert!(!validate_grid_size(0));
    assert!(!validate_grid_size(3));
    assert!(!validate_grid_size(100));

    // Test grid_order
    assert_eq!(grid_order(2), 1);
    assert_eq!(grid_order(4), 2);
    assert_eq!(grid_order(8), 3);
    assert_eq!(grid_order(16), 4);
    assert_eq!(grid_order(256), 8);
    assert_eq!(grid_order(1024), 10);

    // Test grid_capacity (bytes for RGBA encoding)
    assert_eq!(grid_capacity(4), 64); // 4*4*4
    assert_eq!(grid_capacity(8), 256); // 8*8*4
    assert_eq!(grid_capacity(16), 1024); // 16*16*4
    assert_eq!(grid_capacity(64), 16384); // 64*64*4
}
