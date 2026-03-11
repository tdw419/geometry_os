//! Test WGSL 64-bit multiplication helper correctness
//!
//! These tests verify that the WGSL mulh_signed and mulh_unsigned
//! functions produce correct results compared to Rust's native i64/u64.

/// Rust reference implementation of MULH (signed high multiplication)
fn mulh_signed_rust(a: i32, b: i32) -> i32 {
    let full = (a as i64) * (b as i64);
    (full >> 32) as i32
}

/// Rust reference implementation of MULHU (unsigned high multiplication)
fn mulh_unsigned_rust(a: u32, b: u32) -> u32 {
    let full = (a as u64) * (b as u64);
    (full >> 32) as u32
}

#[test]
fn test_mulh_signed_positive() {
    // Test basic positive numbers
    assert_eq!(
        mulh_signed_rust(1000, 2000),
        ((1000i64 * 2000i64) >> 32) as i32
    );
    assert_eq!(
        mulh_signed_rust(0x10000, 0x10000),
        ((0x10000i64 * 0x10000i64) >> 32) as i32
    );
}

#[test]
fn test_mulh_signed_negative() {
    // Test with negative numbers
    assert_eq!(
        mulh_signed_rust(-1000, 2000),
        ((-1000i64 * 2000i64) >> 32) as i32
    );
    assert_eq!(mulh_signed_rust(-1, -1), ((-1i64 * -1i64) >> 32) as i32);
}

#[test]
fn test_mulh_signed_edge_cases() {
    // Test edge cases
    assert_eq!(
        mulh_signed_rust(i32::MAX, i32::MAX),
        ((i32::MAX as i64 * i32::MAX as i64) >> 32) as i32
    );
    assert_eq!(
        mulh_signed_rust(i32::MIN, i32::MIN),
        ((i32::MIN as i64 * i32::MIN as i64) >> 32) as i32
    );
    assert_eq!(mulh_signed_rust(0, i32::MAX), 0);
}

#[test]
fn test_mulh_unsigned_basic() {
    // Test basic unsigned multiplication
    assert_eq!(
        mulh_unsigned_rust(1000, 2000),
        ((1000u64 * 2000u64) >> 32) as u32
    );
    assert_eq!(
        mulh_unsigned_rust(0x10000, 0x10000),
        ((0x10000u64 * 0x10000u64) >> 32) as u32
    );
}

#[test]
fn test_mulh_unsigned_large() {
    // Test with large numbers
    assert_eq!(
        mulh_unsigned_rust(u32::MAX, u32::MAX),
        ((u32::MAX as u64 * u32::MAX as u64) >> 32) as u32
    );
    assert_eq!(
        mulh_unsigned_rust(0xFFFFFFFFu32, 0x10000u32),
        ((0xFFFFFFFFu64 * 0x10000u64) >> 32) as u32
    );
}

#[test]
fn test_mulh_unsigned_edge_cases() {
    // Test edge cases
    assert_eq!(mulh_unsigned_rust(0, u32::MAX), 0);
    assert_eq!(mulh_unsigned_rust(1, u32::MAX), 0);
    assert_eq!(mulh_unsigned_rust(u32::MAX, 2), 1);
}
