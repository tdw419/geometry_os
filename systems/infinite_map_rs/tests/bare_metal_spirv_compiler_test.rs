//! Tests for SPIR-V Compiler Stub
//!
//! Task 3 of Phase 4: Bare Metal Boot

use infinite_map_rs::bare_metal::SpirvCompiler;

#[test]
fn test_spirv_compiler_exists() {
    // Verify the compiler struct can be instantiated
    let _compiler = SpirvCompiler;
}

#[test]
fn test_compile_wgsl_to_spirv_returns_error() {
    // The stub should return an error indicating naga/tint is required
    let result = SpirvCompiler::compile_wgsl_to_spirv("fn main() {}");

    assert!(result.is_err());
    let err = result.unwrap_err();
    assert!(err.contains("naga") || err.contains("tint"));
}

#[test]
#[ignore = "Requires naga crate for actual compilation"]
fn test_compile_placeholder() {
    // This test is ignored until naga/tint integration is complete
    // It serves as a placeholder for future shader compilation tests
    let _result = SpirvCompiler::compile_wgsl_to_spirv(
        r#"
        @vertex
        fn main() -> @builtin(position) vec4<f32> {
            return vec4<f32>(0.0, 0.0, 0.0, 1.0);
        }
    "#,
    );
}
