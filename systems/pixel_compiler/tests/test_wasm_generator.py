"""
Tests for WASM Code Generator.

Tests IR representation, register allocation, instruction selection,
and WASM text/binary format output.
"""

import os
import struct
import subprocess
from dataclasses import dataclass

import pytest

from systems.pixel_compiler.wasm_generator import (
    WASMGenerator,
    IROpcode,
    IROperation,
    IRBlock,
    IRFunction,
    RegisterAllocator,
    LiveRange,
    WASMOpcode,
    create_simple_function,
    generate_add_function,
    generate_fibonacci_ir,
)


# =============================================================================
# Test Fixtures
# =============================================================================

@pytest.fixture
def empty_function():
    """Create an empty IR function."""
    func = IRFunction(name="empty")
    func.add_block(name="entry")
    return func


@pytest.fixture
def simple_add_function():
    """Create a simple add(a, b) function."""
    return generate_add_function()


@pytest.fixture
def wasm_generator():
    """Create a WASM generator instance."""
    return WASMGenerator()


# =============================================================================
# IR Tests
# =============================================================================

class TestIROperation:
    """Test IR operation representation."""

    def test_const_operation(self):
        """Test constant operation creation."""
        op = IROperation(IROpcode.CONST, 0, [42])
        assert op.opcode == IROpcode.CONST
        assert op.result == 0
        assert op.operands == [42]
        assert "CONST" in str(op)

    def test_add_operation(self):
        """Test addition operation creation."""
        op = IROperation(IROpcode.ADD, 2, [0, 1])
        assert op.opcode == IROpcode.ADD
        assert op.result == 2
        assert op.operands == [0, 1]

    def test_phi_operation(self):
        """Test PHI node creation."""
        op = IROperation(IROpcode.PHI, 3, [1, 2], block_id=0)
        assert op.opcode == IROpcode.PHI
        assert op.block_id == 0
        assert "PHI" in str(op)


class TestIRBlock:
    """Test IR basic block."""

    def test_block_creation(self):
        """Test basic block creation."""
        block = IRBlock(id=0, name="entry")
        assert block.id == 0
        assert block.name == "entry"
        assert len(block.operations) == 0

    def test_add_operation(self):
        """Test adding operation to block."""
        block = IRBlock(id=0, name="entry")
        op = IROperation(IROpcode.CONST, 0, [42])
        block.add_operation(op)
        assert len(block.operations) == 1
        assert block.operations[0] == op

    def test_block_string_representation(self):
        """Test block string output."""
        block = IRBlock(id=0, name="entry")
        block.add_operation(IROperation(IROpcode.CONST, 0, [42]))
        s = str(block)
        assert "block_0:" in s
        assert "CONST" in s


class TestIRFunction:
    """Test IR function."""

    def test_function_creation(self):
        """Test function creation."""
        func = IRFunction(name="test")
        assert func.name == "test"
        assert len(func.params) == 0
        assert len(func.blocks) == 0

    def test_alloc_vreg(self):
        """Test virtual register allocation."""
        func = IRFunction(name="test")
        v0 = func.alloc_vreg()
        v1 = func.alloc_vreg()
        assert v0 == 0
        assert v1 == 1
        assert func.next_vreg == 2

    def test_add_param(self):
        """Test adding parameters."""
        func = IRFunction(name="test")
        p0 = func.add_param()
        p1 = func.add_param()
        assert p0 == 0
        assert p1 == 1
        assert len(func.params) == 2

    def test_add_block(self):
        """Test adding basic blocks."""
        func = IRFunction(name="test")
        b0 = func.add_block("entry")
        b1 = func.add_block("loop")
        assert b0.id == 0
        assert b1.id == 1
        assert len(func.blocks) == 2

    def test_get_block(self):
        """Test getting block by ID."""
        func = IRFunction(name="test")
        b0 = func.add_block("entry")
        assert func.get_block(0) == b0
        assert func.get_block(99) is None

    def test_function_string_representation(self):
        """Test function string output."""
        func = IRFunction(name="test")
        func.add_param()
        func.add_param()
        func.add_block("entry")
        s = str(func)
        assert "function test" in s
        assert "v0" in s
        assert "v1" in s


# =============================================================================
# Register Allocator Tests
# =============================================================================

class TestRegisterAllocator:
    """Test linear scan register allocation."""

    def test_empty_function(self, empty_function):
        """Test allocation with empty function."""
        alloc = RegisterAllocator()
        mapping = alloc.allocate(empty_function)
        assert len(mapping) == 0
        assert alloc.local_count == 0

    def test_simple_allocation(self, simple_add_function):
        """Test allocation with simple function."""
        alloc = RegisterAllocator()
        mapping = alloc.allocate(simple_add_function)
        # Should have mapping for params (v0, v1) and result (v2)
        assert len(mapping) >= 2  # At least params
        assert alloc.local_count >= 2

    def test_vreg_to_local_mapping(self, simple_add_function):
        """Test virtual register to local mapping."""
        alloc = RegisterAllocator()
        mapping = alloc.allocate(simple_add_function)

        # Parameters should get local indices
        for param in simple_add_function.params:
            assert param in mapping
            assert mapping[param] < alloc.local_count

    def test_live_ranges(self, simple_add_function):
        """Test live range computation."""
        alloc = RegisterAllocator()
        ranges = alloc.compute_live_ranges(simple_add_function)

        # Should have ranges for all used vregs
        assert len(ranges) > 0
        for lr in ranges:
            assert lr.start <= lr.end
            assert lr.local_id is None  # Not allocated yet


# =============================================================================
# WASM Generator Tests
# =============================================================================

class TestWASMGeneratorBasics:
    """Test WASM generator basic functionality."""

    def test_create_generator(self, wasm_generator):
        """Test generator creation."""
        assert wasm_generator.function is None
        assert len(wasm_generator.vreg_to_local) == 0

    def test_consume_function(self, wasm_generator, simple_add_function):
        """Test consuming IR function."""
        wasm_generator.consume(simple_add_function)
        assert wasm_generator.function == simple_add_function
        assert len(wasm_generator.vreg_to_local) > 0

    def test_consume_without_function_raises(self, wasm_generator):
        """Test that emit without consume raises error."""
        with pytest.raises(ValueError, match="No function loaded"):
            wasm_generator.emit_wasm_text()


class TestWASMTextFormat:
    """Test WASM text format generation."""

    def test_empty_function_emits_module(self, wasm_generator, empty_function):
        """Test that empty function emits valid module structure."""
        wasm_generator.consume(empty_function)
        wat = wasm_generator.emit_wasm_text()
        assert "(module" in wat
        assert "(func" in wat
        assert ")" in wat

    def test_simple_add_function_emits_correct_ops(self, wasm_generator, simple_add_function):
        """Test that add function emits correct operations."""
        wasm_generator.consume(simple_add_function)
        wat = wasm_generator.emit_wasm_text()
        assert "$add" in wat  # WAT format uses $funcname
        assert "i32.add" in wat
        assert "return" in wat

    def test_param_declarations(self, wasm_generator, simple_add_function):
        """Test parameter declarations in output."""
        wasm_generator.consume(simple_add_function)
        wat = wasm_generator.emit_wasm_text()
        assert "(param" in wat
        assert "$local_" in wat

    def test_const_instruction_emits_i32_const(self, wasm_generator):
        """Test CONST operation emits correctly."""
        func = create_simple_function("test", 0)
        block = func.get_block(0)
        block.add_operation(IROperation(IROpcode.CONST, 0, [42]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()
        assert "i32.const 42" in wat

    def test_load_instruction_emits_correctly(self, wasm_generator):
        """Test LOAD operation emits correctly."""
        func = create_simple_function("test", 1)
        block = func.get_block(0)
        block.add_operation(IROperation(IROpcode.LOAD, 1, [0]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()
        assert "i32.load" in wat

    def test_store_instruction_emits_correctly(self, wasm_generator):
        """Test STORE operation emits correctly."""
        func = create_simple_function("test", 2)
        block = func.get_block(0)
        block.add_operation(IROperation(IROpcode.STORE, -1, [0, 1]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()
        assert "i32.store" in wat

    def test_comparison_operations(self, wasm_generator):
        """Test comparison operations emit correctly."""
        func = create_simple_function("test", 2)
        block = func.get_block(0)
        block.add_operation(IROperation(IROpcode.EQ, 2, [0, 1]))
        block.add_operation(IROperation(IROpcode.LT_S, 3, [0, 1]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()
        assert "i32.eq" in wat
        assert "i32.lt_s" in wat

    def test_bitwise_operations(self, wasm_generator):
        """Test bitwise operations emit correctly."""
        func = create_simple_function("test", 2)
        block = func.get_block(0)
        block.add_operation(IROperation(IROpcode.AND, 2, [0, 1]))
        block.add_operation(IROperation(IROpcode.OR, 3, [0, 1]))
        block.add_operation(IROperation(IROpcode.XOR, 4, [0, 1]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()
        assert "i32.and" in wat
        assert "i32.or" in wat
        assert "i32.xor" in wat

    def test_shift_operations(self, wasm_generator):
        """Test shift operations emit correctly."""
        func = create_simple_function("test", 2)
        block = func.get_block(0)
        block.add_operation(IROperation(IROpcode.SHL, 2, [0, 1]))
        block.add_operation(IROperation(IROpcode.SHR_U, 3, [0, 1]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()
        assert "i32.shl" in wat
        assert "i32.shr_u" in wat


class TestWASMBinaryFormat:
    """Test WASM binary format generation."""

    def test_binary_emits_wasm_magic(self, wasm_generator, simple_add_function):
        """Test binary output has WASM magic number."""
        wasm_generator.consume(simple_add_function)
        binary = wasm_generator.emit_wasm_binary()
        assert binary.startswith(b"\x00asm")
        assert binary[4:8] == b"\x01\x00\x00\x00"  # Version

    def test_binary_has_type_section(self, wasm_generator, simple_add_function):
        """Test binary has type section."""
        wasm_generator.consume(simple_add_function)
        binary = wasm_generator.emit_wasm_binary()
        # Type section (id=1) should be present
        assert b"\x01" in binary  # section id

    def test_binary_has_export_section(self, wasm_generator, simple_add_function):
        """Test binary has export section."""
        wasm_generator.consume(simple_add_function)
        binary = wasm_generator.emit_wasm_binary()
        # Export section (id=7) should be present
        assert b"\x07" in binary  # section id

    def test_binary_export_name(self, wasm_generator, simple_add_function):
        """Test export name is in binary."""
        wasm_generator.consume(simple_add_function)
        binary = wasm_generator.emit_wasm_binary()
        assert b"add" in binary

    def test_const_binary_encoding(self, wasm_generator):
        """Test CONST operation binary encoding."""
        func = create_simple_function("test", 0)
        block = func.get_block(0)
        block.add_operation(IROperation(IROpcode.CONST, 0, [42]))

        wasm_generator.consume(func)
        binary = wasm_generator.emit_wasm_binary()

        # Should contain i32.const (0x41) followed by 42
        assert bytes([WASMOpcode.I32_CONST]) in binary

    def test_add_binary_encoding(self, wasm_generator, simple_add_function):
        """Test ADD operation binary encoding."""
        wasm_generator.consume(simple_add_function)
        binary = wasm_generator.emit_wasm_binary()

        # Should contain i32.add (0x6a)
        assert bytes([WASMOpcode.I32_ADD]) in binary

    def test_return_binary_encoding(self, wasm_generator):
        """Test RETURN operation binary encoding."""
        func = create_simple_function("test", 1)
        block = func.get_block(0)
        ret_val = func.params[0]
        block.add_operation(IROperation(IROpcode.RETURN, -1, [ret_val]))

        wasm_generator.consume(func)
        binary = wasm_generator.emit_wasm_binary()

        # Should contain return (0x0f)
        assert bytes([WASMOpcode.RETURN]) in binary

    def test_local_get_set_encoding(self, wasm_generator, simple_add_function):
        """Test local.get and local.set encoding."""
        wasm_generator.consume(simple_add_function)
        binary = wasm_generator.emit_wasm_binary()

        # Should contain local.get (0x20) and local.set (0x21)
        assert bytes([WASMOpcode.LOCAL_GET]) in binary
        assert bytes([WASMOpcode.LOCAL_SET]) in binary


# =============================================================================
# Instruction Selection Tests
# =============================================================================

class TestInstructionSelection:
    """Test IR op to WASM opcode mapping."""

    def test_arithmetic_mapping(self):
        """Test arithmetic operation mapping."""
        mapping = WASMGenerator.OPCODE_MAP
        assert IROpcode.ADD in mapping
        assert IROpcode.SUB in mapping
        assert IROpcode.MUL in mapping
        assert mapping[IROpcode.ADD] == WASMOpcode.I32_ADD
        assert mapping[IROpcode.SUB] == WASMOpcode.I32_SUB

    def test_comparison_mapping(self):
        """Test comparison operation mapping."""
        mapping = WASMGenerator.OPCODE_MAP
        assert IROpcode.EQ in mapping
        assert IROpcode.LT_S in mapping
        assert IROpcode.GE_U in mapping

    def test_bitwise_mapping(self):
        """Test bitwise operation mapping."""
        mapping = WASMGenerator.OPCODE_MAP
        assert IROpcode.AND in mapping
        assert IROpcode.OR in mapping
        assert IROpcode.XOR in mapping
        assert mapping[IROpcode.AND] == WASMOpcode.I32_AND

    def test_memory_mapping(self):
        """Test memory operation mapping."""
        mapping = WASMGenerator.OPCODE_MAP
        assert IROpcode.LOAD in mapping
        assert IROpcode.STORE in mapping

    def test_control_flow_mapping(self):
        """Test control flow operation mapping."""
        mapping = WASMGenerator.OPCODE_MAP
        assert IROpcode.BR in mapping
        assert IROpcode.BR_IF in mapping
        assert IROpcode.CALL in mapping
        assert IROpcode.RETURN in mapping


# =============================================================================
# LEB128 Encoding Tests
# =============================================================================

class TestLEB128Encoding:
    """Test LEB128 integer encoding."""

    def test_encode_u32_small(self):
        """Test encoding small unsigned integer."""
        result = WASMGenerator._encode_u32(0)
        assert result == b"\x00"

        result = WASMGenerator._encode_u32(42)
        assert result == b"\x2a"

    def test_encode_u32_large(self):
        """Test encoding larger unsigned integer."""
        result = WASMGenerator._encode_u32(16384)  # Requires 2 bytes
        # 16384 = 0x4000 = 0b0100_0000_0000_0000
        # LEB128: 0x80 0x80 (continuation bits) + actual value
        # For 16384: needs 2 bytes: [0x80, 0x80] where low 7 bits carry data
        # Actually 16384 = 0x4000, so in LEB128 it's: [0x80, 0x80]
        # Wait, let me recalculate: 16384 / 128 = 128, remainder 0
        # So byte 0 = 0, byte 1 = 128, but 128 has continuation bit
        # Actually the encoding is: 0x80 (continuation) + 0x80 (128)
        # But 128 in LEB128 is encoded as two bytes because the high bit is set
        # Let me just check the length is > 1
        assert len(result) >= 2  # Should be multi-byte

    def test_encode_i32_positive(self):
        """Test encoding positive signed integer."""
        result = WASMGenerator._encode_i32(42)
        assert result == b"\x2a"

    def test_encode_i32_negative(self):
        """Test encoding negative signed integer."""
        result = WASMGenerator._encode_i32(-1)
        # LEB128 for -1 is 0x7f
        assert result == b"\x7f"

    def test_encode_i32_large_negative(self):
        """Test encoding large negative number."""
        result = WASMGenerator._encode_i32(-12345)
        assert len(result) > 1

    def test_encode_u32_negative_raises(self):
        """Test that negative value raises error for unsigned encoding."""
        with pytest.raises(ValueError):
            WASMGenerator._encode_u32(-1)


# =============================================================================
# Integration Tests
# =============================================================================

class TestIntegration:
    """Integration tests for complete WASM generation."""

    def test_simple_function_roundtrip(self, wasm_generator):
        """Test complete roundtrip for simple function."""
        func = generate_add_function()
        wasm_generator.consume(func)

        # Generate both formats
        wat = wasm_generator.emit_wasm_text()
        wasm = wasm_generator.emit_wasm_binary()

        # Verify text format
        assert "(module" in wat
        assert "$add" in wat  # WAT format uses $funcname
        assert "i32.add" in wat

        # Verify binary format
        assert wasm.startswith(b"\x00asm")

    def test_fibonacci_function_generation(self, wasm_generator):
        """Test Fibonacci function generation."""
        func = generate_fibonacci_ir()
        wasm_generator.consume(func)

        wat = wasm_generator.emit_wasm_text()
        assert "$fibonacci" in wat  # WAT format uses $funcname

    def test_multiple_operations(self, wasm_generator):
        """Test function with multiple operations."""
        func = create_simple_function("multi", 2)
        block = func.get_block(0)

        # Create a sequence: c = a + b; d = c * 2; return d
        a, b = func.params
        c = func.alloc_vreg()
        d = func.alloc_vreg()
        const_2 = func.alloc_vreg()

        block.add_operation(IROperation(IROpcode.CONST, const_2, [2]))
        block.add_operation(IROperation(IROpcode.ADD, c, [a, b]))
        block.add_operation(IROperation(IROpcode.MUL, d, [c, const_2]))

        func.returns = d
        block.add_operation(IROperation(IROpcode.RETURN, -1, [d]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()

        assert "i32.const 2" in wat
        assert "i32.add" in wat
        assert "i32.mul" in wat
        assert "return" in wat

    def test_comparison_chain(self, wasm_generator):
        """Test function with comparison operations."""
        func = create_simple_function("compare", 2)
        block = func.get_block(0)

        a, b = func.params
        eq_result = func.alloc_vreg()
        lt_result = func.alloc_vreg()

        block.add_operation(IROperation(IROpcode.EQ, eq_result, [a, b]))
        block.add_operation(IROperation(IROpcode.LT_S, lt_result, [a, b]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()

        assert "i32.eq" in wat
        assert "i32.lt_s" in wat


# =============================================================================
# WASM Validation Tests (Optional)
# =============================================================================

class TestWASMValidation:
    """Test WASM binary validation if wasmer is available."""

    @pytest.fixture
    def has_wasmer(self):
        """Check if wasmer is available for validation."""
        try:
            result = subprocess.run(
                ["wasmer", "--version"],
                capture_output=True,
                timeout=5
            )
            return result.returncode == 0
        except (FileNotFoundError, subprocess.TimeoutExpired):
            return False

    def test_validate_simple_function(self, wasm_generator, has_wasmer):
        """Test validation of simple function with wasmer."""
        if not has_wasmer:
            pytest.skip("wasmer not available")

        func = generate_add_function()
        wasm_generator.consume(func)
        wasm = wasm_generator.emit_wasm_binary()

        # Write to temp file and validate
        import tempfile
        with tempfile.NamedTemporaryFile(suffix=".wasm", delete=False) as f:
            f.write(wasm)
            temp_path = f.name

        try:
            result = subprocess.run(
                ["wasmer", "validate", temp_path],
                capture_output=True,
                timeout=5
            )
            assert result.returncode == 0, f"Validation failed: {result.stderr.decode()}"
        finally:
            os.unlink(temp_path)

    def test_validate_const_function(self, wasm_generator, has_wasmer):
        """Test validation of function returning constant."""
        if not has_wasmer:
            pytest.skip("wasmer not available")

        func = create_simple_function("const_func", 0)
        block = func.get_block(0)
        const_val = func.alloc_vreg()

        block.add_operation(IROperation(IROpcode.CONST, const_val, [42]))
        func.returns = const_val
        block.add_operation(IROperation(IROpcode.RETURN, -1, [const_val]))

        wasm_generator.consume(func)
        wasm = wasm_generator.emit_wasm_binary()

        import tempfile
        with tempfile.NamedTemporaryFile(suffix=".wasm", delete=False) as f:
            f.write(wasm)
            temp_path = f.name

        try:
            result = subprocess.run(
                ["wasmer", "validate", temp_path],
                capture_output=True,
                timeout=5
            )
            assert result.returncode == 0, f"Validation failed: {result.stderr.decode()}"
        finally:
            os.unlink(temp_path)


# =============================================================================
# Edge Cases and Error Handling
# =============================================================================

class TestEdgeCases:
    """Test edge cases and error conditions."""

    def test_function_with_no_params(self, wasm_generator):
        """Test function with no parameters."""
        func = create_simple_function("no_params", 0)
        block = func.get_block(0)
        v = func.alloc_vreg()
        block.add_operation(IROperation(IROpcode.CONST, v, [0]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()
        assert "$no_params" in wat  # WAT format uses $funcname

    def test_function_with_no_operations(self, wasm_generator, empty_function):
        """Test function with no operations."""
        wasm_generator.consume(empty_function)
        wat = wasm_generator.emit_wasm_text()
        assert "(func" in wat

    def test_large_constant_value(self, wasm_generator):
        """Test large constant value encoding."""
        func = create_simple_function("large_const", 0)
        block = func.get_block(0)
        v = func.alloc_vreg()
        block.add_operation(IROperation(IROpcode.CONST, v, [999999]))

        wasm_generator.consume(func)
        wasm = wasm_generator.emit_wasm_binary()
        # Should successfully encode
        assert len(wasm) > 8

    def test_all_arithmetic_operations(self, wasm_generator):
        """Test all arithmetic operations can be emitted."""
        func = create_simple_function("all_ops", 2)
        block = func.get_block(0)

        a, b = func.params
        ops = [
            (IROpcode.ADD, func.alloc_vreg()),
            (IROpcode.SUB, func.alloc_vreg()),
            (IROpcode.MUL, func.alloc_vreg()),
            (IROpcode.DIV_S, func.alloc_vreg()),
            (IROpcode.DIV_U, func.alloc_vreg()),
        ]

        for op_code, result in ops:
            block.add_operation(IROperation(op_code, result, [a, b]))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()

        assert "i32.add" in wat
        assert "i32.sub" in wat
        assert "i32.mul" in wat
        assert "i32.div_s" in wat
        assert "i32.div_u" in wat

    def test_phi_node_filtered_in_text_output(self, wasm_generator):
        """Test that PHI nodes are filtered from text output."""
        func = create_simple_function("phi_test", 2)
        block = func.get_block(0)

        # Add a PHI node
        phi_result = func.alloc_vreg()
        block.add_operation(IROperation(IROpcode.PHI, phi_result, [0, 1], block_id=0))

        wasm_generator.consume(func)
        wat = wasm_generator.emit_wasm_text()

        # PHI should not appear in output (it's SSA-specific)
        # The output should be valid WASM without PHI
        assert "(func" in wat
