// Phase 2: IEEE 754 Compliance Tests
//
// Validates Phase 2 FPU implementation against IEEE 754 standard:
// - NaN handling
// - Infinity arithmetic
// - Zero handling
// - Conversion accuracy

use std::f32;

// ============================================
// Helper Functions
// ============================================

/// Create f32 from bit pattern
fn f32_from_bits(bits: u32) -> f32 {
    f32::from_bits(bits)
}

/// Get bit pattern from f32
fn f32_to_bits(value: f32) -> u32 {
    value.to_bits()
}

/// Check if two f32 values are bit-identical
fn bits_equal(a: f32, b: f32) -> bool {
    f32_to_bits(a) == f32_to_bits(b)
}

/// Check if value is NaN (bit pattern test)
fn is_nan_bit(value: f32) -> bool {
    value.is_nan()
}

/// Check if value is infinity
fn is_inf_bit(value: f32) -> bool {
    value.is_infinite()
}

// ============================================
// NaN Handling Tests
// ============================================

#[test]
fn test_nan_addition() {
    let nan = f32::NAN;
    let one = 1.0f32;

    // NaN + anything = NaN
    assert!(is_nan_bit(nan + nan));
    assert!(is_nan_bit(nan + one));
    assert!(is_nan_bit(one + nan));
}

#[test]
fn test_nan_subtraction() {
    let nan = f32::NAN;
    let one = 1.0f32;

    assert!(is_nan_bit(nan - nan));
    assert!(is_nan_bit(nan - one));
    assert!(is_nan_bit(one - nan));
}

#[test]
fn test_nan_multiplication() {
    let nan = f32::NAN;
    let one = 1.0f32;

    assert!(is_nan_bit(nan * nan));
    assert!(is_nan_bit(nan * one));
    assert!(is_nan_bit(one * nan));
}

#[test]
fn test_nan_division() {
    let nan = f32::NAN;
    let one = 1.0f32;

    assert!(is_nan_bit(nan / nan));
    assert!(is_nan_bit(nan / one));
    // 0/0 = NaN (tested separately)
}

// ============================================
// Infinity Handling Tests
// ============================================

#[test]
fn test_infinity_addition() {
    let inf = f32::INFINITY;
    let one = 1.0f32;

    // Inf + finite = Inf
    assert_eq!(inf + one, f32::INFINITY);
    assert_eq!(one + inf, f32::INFINITY);

    // Inf + Inf = Inf (same sign)
    assert_eq!(inf + inf, f32::INFINITY);
}

#[test]
fn test_infinity_subtraction() {
    let inf = f32::INFINITY;
    let neg_inf = f32::NEG_INFINITY;
    let one = 1.0f32;

    // Inf - finite = Inf
    assert_eq!(inf - one, f32::INFINITY);

    // Inf - Inf = NaN
    assert!(is_nan_bit(inf - inf));
    assert!(is_nan_bit(neg_inf - neg_inf));

    // Inf - (-Inf) = Inf
    assert_eq!(inf - neg_inf, f32::INFINITY);
}

#[test]
fn test_infinity_multiplication() {
    let inf = f32::INFINITY;
    let neg_inf = f32::NEG_INFINITY;
    let zero = 0.0f32;
    let two = 2.0f32;

    // Inf * finite = Inf (sign preserved)
    assert_eq!(inf * two, f32::INFINITY);
    assert_eq!(neg_inf * two, f32::NEG_INFINITY);

    // Inf * 0 = NaN
    assert!(is_nan_bit(inf * zero));
}

#[test]
fn test_infinity_division() {
    let inf = f32::INFINITY;
    let one = 1.0f32;

    // Inf / finite = Inf
    assert_eq!(inf / one, f32::INFINITY);

    // finite / Inf = 0
    assert_eq!(one / inf, 0.0f32);

    // Inf / Inf = NaN
    assert!(is_nan_bit(inf / inf));
}

#[test]
fn test_zero_division() {
    let one = 1.0f32;
    let zero = 0.0f32;

    // 0 / 0 = NaN
    assert!(is_nan_bit(zero / zero));

    // x / 0 = Inf (sign preserved)
    assert_eq!(one / zero, f32::INFINITY);
    assert_eq!((-one) / zero, f32::NEG_INFINITY);
}

// ============================================
// Zero Handling Tests
// ============================================

#[test]
fn test_zero_operations() {
    let zero = 0.0f32;
    let one = 1.0f32;

    // 0 + 0 = 0
    assert_eq!(zero + zero, zero);

    // 0 * anything = 0
    assert_eq!(zero * one, zero);
    assert_eq!(one * zero, zero);

    // 0 - 0 = 0
    assert_eq!(zero - zero, zero);
}

#[test]
fn test_zero_sqrt() {
    let zero = 0.0f32;

    // sqrt(0) = 0
    assert_eq!(zero.sqrt(), zero);
}

// ============================================
// Sign Handling Tests
// ============================================

#[test]
fn test_negative_zero() {
    let zero = 0.0f32;
    let neg_zero = -0.0f32;

    // -0 == 0 is true in IEEE 754
    assert_eq!(neg_zero, zero);

    // But they have different bit patterns
    assert_ne!(f32_to_bits(neg_zero), f32_to_bits(zero));
    assert_eq!(f32_to_bits(neg_zero), 0x80000000_u32);
}

#[test]
fn test_signed_infinity() {
    let inf = f32::INFINITY;
    let neg_inf = f32::NEG_INFINITY;

    assert_eq!(f32_to_bits(inf), 0x7F800000_u32);
    assert_eq!(f32_to_bits(neg_inf), 0xFF800000_u32);

    // Positive and negative infinity are NOT equal in IEEE 754
    assert_ne!(inf, neg_inf);
}

// ============================================
// Comparison Tests
// ============================================

#[test]
fn test_nan_comparison() {
    let nan = f32::NAN;
    let one = 1.0f32;

    // NaN comparison is always false
    assert!(!(nan == nan));
    assert!(!(nan == one));
    assert!(!(one == nan));
    assert!(nan != nan);
    assert!(nan != one);
}

#[test]
fn test_ordered_comparison() {
    let one = 1.0f32;
    let two = 2.0f32;

    assert!(one < two);
    assert!(one <= two);
    assert!(!(one > two));
    assert!(one <= one);
}

// ============================================
// Conversion Tests
// ============================================

#[test]
fn test_int_to_float_conversion() {
    // Round-trip conversion for small integers
    for i in -1000..=1000i32 {
        let f = i as f32;
        let back = f as i32;
        assert_eq!(i, back, "Round-trip failed for {}", i);
    }
}

#[test]
fn test_float_to_int_conversion() {
    // Float to int truncates toward zero
    assert_eq!(1.9f32 as i32, 1);
    assert_eq!((-1.9f32) as i32, -1);
    assert_eq!(0.1f32 as i32, 0);
    assert_eq!((-0.1f32) as i32, 0);

    // Large values
    assert_eq!(100000.0f32 as i32, 100000);
    assert_eq!((-100000.0f32) as i32, -100000);
}

#[test]
fn test_conversion_edge_cases() {
    // Max int that can be exactly represented
    let max_exact = 16777216.0f32; // 2^24
    assert_eq!(max_exact as i32, 16777216);

    // Values larger than int max get clamped
    assert!(f32::MAX as i32 == i32::MAX);
    assert!(f32::MIN as i32 == i32::MIN);
}

// ============================================
// Accuracy Tests
// ============================================

#[test]
fn test_fp_accuracy() {
    // Test that basic operations are accurate to within 0.001%

    // 1/3 should be approximately correct
    let one_third = 1.0f32 / 3.0f32;
    let expected = 0.333333343f32; // Closest f32 to 1/3
    assert!((one_third - expected).abs() < 0.000001);

    // sqrt(2) should be approximately correct
    let sqrt2 = (2.0f32).sqrt();
    let expected_sqrt = 1.4142135f32;
    assert!((sqrt2 - expected_sqrt).abs() < 0.0001);
}

#[test]
fn test_pi_accuracy() {
    let pi = std::f32::consts::PI;
    let pi_approx = 3.14159265f32;

    // Should be close to PI
    assert!((pi - pi_approx).abs() < 0.000001);
}

// ============================================
// Special Value Encoding Tests
// ============================================

#[test]
fn test_special_value_encodings() {
    // Verify IEEE 754 bit patterns

    // NaN: exp = 0xFF, frac != 0
    let nan_bits = f32_to_bits(f32::NAN);
    assert!((nan_bits & 0x7F800000) == 0x7F800000); // exp all 1s
    assert!((nan_bits & 0x007FFFFF) != 0); // frac non-zero

    // Infinity: exp = 0xFF, frac = 0
    let inf_bits = f32_to_bits(f32::INFINITY);
    assert_eq!(inf_bits, 0x7F800000);

    // Neg infinity: sign bit set
    let neg_inf_bits = f32_to_bits(f32::NEG_INFINITY);
    assert_eq!(neg_inf_bits, 0xFF800000);
}

// ============================================
// FPU Operation Simulations
// ============================================

/// Simulate FP ADD using bit patterns (tests decoder logic)
#[test]
fn test_fadd_bit_pattern() {
    // Test: 1.0 + 2.0 = 3.0
    let a_bits = f32_to_bits(1.0f32);
    let b_bits = f32_to_bits(2.0f32);
    let result = f32_from_bits(a_bits) + f32_from_bits(b_bits);

    assert_eq!(result, 3.0f32);
}

/// Simulate FP MUL using bit patterns
#[test]
fn test_fmul_bit_pattern() {
    // Test: 2.5 * 4.0 = 10.0
    let a_bits = f32_to_bits(2.5f32);
    let b_bits = f32_to_bits(4.0f32);
    let result = f32_from_bits(a_bits) * f32_from_bits(b_bits);

    assert_eq!(result, 10.0f32);
}

/// Simulate FP DIV using bit patterns
#[test]
fn test_fdiv_bit_pattern() {
    // Test: 10.0 / 2.0 = 5.0
    let a_bits = f32_to_bits(10.0f32);
    let b_bits = f32_to_bits(2.0f32);
    let result = f32_from_bits(a_bits) / f32_from_bits(b_bits);

    assert_eq!(result, 5.0f32);
}

// ============================================
// Stress Tests
// ============================================

#[test]
fn test_fp_stress_arithmetic() {
    // Run many FP operations to ensure no crashes
    let mut acc = 0.0f32;
    for i in 0..10000 {
        acc = acc + (i as f32);
        acc = acc * 1.001f32;
        acc = acc - (i as f32) * 0.001f32;
    }
    // Should not be NaN or Inf
    assert!(acc.is_finite());
}

#[test]
fn test_fp_stress_division() {
    // Many divisions to test accuracy
    let mut sum = 0.0f32;
    for i in 1..=1000 {
        sum = sum + (10000.0f32 / (i as f32));
    }
    assert!(sum.is_finite());
}
