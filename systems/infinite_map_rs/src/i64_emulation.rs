// i64_emulation.rs
/// Utilities for emulating i64 operations using u32 pairs
///
/// This module provides utilities for emulating 64-bit integer operations
/// using 32-bit integer pairs, enabling RISC-V VM execution on GPUs that
/// don't support native i64 operations in WGSL.

/// Split i64 into low and high u32 parts (little-endian)
#[inline]
pub const fn i64_to_u32x2(value: i64) -> (u32, u32) {
    let value = value as u64;
    let lo = (value & 0xFFFFFFFF) as u32;
    let hi = ((value >> 32) & 0xFFFFFFFF) as u32;
    (lo, hi)
}

/// Combine low and high u32 parts into i64 (little-endian)
#[inline]
pub const fn u32x2_to_i64(lo: u32, hi: u32) -> i64 {
    (((hi as u64) << 32) | (lo as u64)) as i64
}

/// Emulate i64 addition using u32 arithmetic with carry
pub fn emulated_i64_add(a: i64, b: i64) -> i64 {
    let a_lo = a as u32;
    let a_hi = ((a as u64) >> 32) as u32;
    let b_lo = b as u32;
    let b_hi = ((b as u64) >> 32) as u32;

    // Add low parts with overflow detection
    let (lo, carry1) = a_lo.overflowing_add(b_lo);

    // Add high parts with carry from low addition
    let (hi, carry2) = a_hi.overflowing_add(b_hi);
    let hi = hi.wrapping_add(carry1 as u32);

    // Handle signed overflow case
    let result = u32x2_to_i64(lo, hi);

    // This is actual overflow - wrap around
    result
}

/// Emulate i64 addition with overflow flag
pub fn emulated_i64_add_overflow(a: i64, b: i64) -> (i64, bool) {
    let a_bits = a as u64;
    let b_bits = b as u64;

    let result = a_bits.wrapping_add(b_bits);
    let overflow = (a_bits ^ result) & (b_bits ^ result) & (1 << 63) != 0;

    (result as i64, overflow)
}

/// Emulate i64 subtraction
pub fn emulated_i64_sub(a: i64, b: i64) -> i64 {
    let a_lo = a as u32;
    let a_hi = ((a as u64) >> 32) as u32;
    let b_lo = b as u32;
    let b_hi = ((b as u64) >> 32) as u32;

    // Subtract low parts with borrow detection
    let (lo, borrow1) = a_lo.overflowing_sub(b_lo);

    // Subtract high parts with borrow from low subtraction
    let (hi, borrow2) = a_hi.overflowing_sub(b_hi);
    let hi = hi.wrapping_sub(borrow1 as u32);

    u32x2_to_i64(lo, hi)
}

/// Emulate i64 left shift
pub fn emulated_i64_shl(value: i64, shift: u32) -> i64 {
    if shift >= 64 {
        return 0;
    }
    (value as u64).wrapping_shl(shift) as i64
}

/// Emulate i64 right shift (arithmetic/sign-preserving)
pub fn emulated_i64_shr(value: i64, shift: u32) -> i64 {
    if shift >= 64 {
        return if value >= 0 { 0 } else { -1 };
    }
    value.wrapping_shr(shift)
}

/// Emulate i64 comparison: less than
pub fn emulated_i64_lt(a: i64, b: i64) -> bool {
    a < b
}

/// Emulate i64 comparison: greater than or equal
pub fn emulated_i64_ge(a: i64, b: i64) -> bool {
    a >= b
}

/// Emulate i64 comparison: equality
pub fn emulated_i64_eq(a: i64, b: i64) -> bool {
    a == b
}

/// Generate WGSL code for i64 emulation
pub fn generate_i64_emulation_wgsl() -> String {
    r#"
// i64 Emulation Helper Functions for WGSL
// Represents i64 as vec2<u32> where x is low 32 bits and y is high 32 bits

// Convert i64 (vec2<u32>) to actual value for operations that don't support it
fn i64_add_emulated(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    let lo = a.x + b.x;
    let carry = select(0u, 1u, lo < a.x); // Detect overflow from low addition
    let hi = a.y + b.y + carry;
    return vec2<u32>(lo, hi);
}

fn i64_sub_emulated(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    let lo = a.x - b.x;
    let borrow = select(0u, 1u, a.x < b.x); // Detect borrow from low subtraction
    let hi = a.y - b.y - borrow;
    return vec2<u32>(lo, hi);
}

fn i64_lt_emulated(a: vec2<u32>, b: vec2<u32>) -> bool {
    // For signed comparison, check sign bit first
    let a_negative = (a.y & 0x80000000u) != 0u;
    let b_negative = (b.y & 0x80000000u) != 0u;

    if (a_negative != b_negative) {
        return a_negative; // Negative is less than positive
    }

    if (a.y != b.y) {
        return a.y < b.y;
    }
    return a.x < b.x;
}

fn i64_eq_emulated(a: vec2<u32>, b: vec2<u32>) -> bool {
    return a.x == b.x && a.y == b.y;
}

// Convert emulated i64 to float for display purposes
fn i64_to_f32_emulated(value: vec2<u32>) -> f32 {
    let sign = f32((value.y & 0x80000000u) != 0u);
    let abs_hi = value.y & 0x7FFFFFFFu;
    let abs_lo = value.x;

    // This is approximate - for precise conversion, need more complex logic
    let high_part = f32(abs_hi) * 4294967296.0; // 2^32
    let low_part = f32(abs_lo);
    let magnitude = high_part + low_part;

    return select(magnitude, -magnitude, sign != 0.0);
}
"#
    .to_string()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_i64_to_u32x2() {
        // Test positive value
        let val: i64 = 0x1234567890ABCDEF;
        let (lo, hi) = i64_to_u32x2(val);
        assert_eq!(lo, 0x90ABCDEF);
        assert_eq!(hi, 0x12345678);
    }

    #[test]
    fn test_u32x2_to_i64() {
        let lo: u32 = 0x90ABCDEF;
        let hi: u32 = 0x12345678;
        let val = u32x2_to_i64(lo, hi);
        assert_eq!(val, 0x1234567890ABCDEF);
    }

    #[test]
    fn test_i64_add_emulation() {
        let a: i64 = 10000000000;
        let b: i64 = 20000000000;
        let result = emulated_i64_add(a, b);
        assert_eq!(result, 30000000000);
    }

    #[test]
    fn test_i64_add_with_overflow() {
        let a: i64 = i64::MAX;
        let b: i64 = 1;
        let (result, overflow) = emulated_i64_add_overflow(a, b);
        assert_eq!(result, i64::MIN); // Wrapped around
        assert!(overflow);
    }

    #[test]
    fn test_i64_subtraction() {
        let a: i64 = 30000000000;
        let b: i64 = 10000000000;
        let result = emulated_i64_sub(a, b);
        assert_eq!(result, 20000000000);
    }

    #[test]
    fn test_i64_shift_left() {
        let val: i64 = 1;
        let result = emulated_i64_shl(val, 4);
        assert_eq!(result, 16);
    }

    #[test]
    fn test_i64_shift_right() {
        let val: i64 = 16;
        let result = emulated_i64_shr(val, 4);
        assert_eq!(result, 1);
    }

    #[test]
    fn test_i64_shift_overflow() {
        let val: i64 = 42;
        assert_eq!(emulated_i64_shl(val, 100), 0);
        assert_eq!(emulated_i64_shr(val, 100), 0);
    }

    #[test]
    fn test_i64_comparisons() {
        assert!(emulated_i64_lt(5, 10));
        assert!(emulated_i64_ge(10, 5));
        assert!(emulated_i64_eq(42, 42));
    }

    #[test]
    fn test_roundtrip_conversion() {
        let original: i64 = -123456789012345;
        let (lo, hi) = i64_to_u32x2(original);
        let recovered = u32x2_to_i64(lo, hi);
        assert_eq!(original, recovered);
    }
}
