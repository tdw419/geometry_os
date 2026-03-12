/**
 * GlyphStratum Error Handling Tests
 * Run with: node test_errors.js
 */

const assert = require('assert');
const {
    GlyphError,
    GlyphValidationError,
    GlyphCoherenceError,
    GlyphExecutionError,
    GlyphTypeError,
    GlyphDependencyError,
    ErrorCodes,
    createError,
    GlyphValidator
} = require('./glyph_errors.js');

let passed = 0;
let failed = 0;

function test(name, fn) {
    try {
        fn();
        console.log(`✓ ${name}`);
        passed++;
    } catch (e) {
        console.log(`✗ ${name}`);
        console.log(`  Error: ${e.message}`);
        failed++;
    }
}

// ========== Error Class Tests ==========
test('GlyphError creates with code and details', () => {
    const err = new GlyphError('Test error', 'TEST001', { foo: 'bar' });
    assert.strictEqual(err.message, 'Test error');
    assert.strictEqual(err.code, 'TEST001');
    assert.strictEqual(err.details.foo, 'bar');
    assert.strictEqual(err.name, 'GlyphError');
});

test('GlyphValidationError has correct name', () => {
    const err = new GlyphValidationError('Invalid', {});
    assert.strictEqual(err.name, 'GlyphValidationError');
    assert.strictEqual(err.code, 'VALIDATION_ERROR');
});

test('GlyphCoherenceError has correct name', () => {
    const err = new GlyphCoherenceError('Coherence failed', {});
    assert.strictEqual(err.name, 'GlyphCoherenceError');
    assert.strictEqual(err.code, 'COHERENCE_ERROR');
});

test('GlyphExecutionError has correct name', () => {
    const err = new GlyphExecutionError('Exec failed', {});
    assert.strictEqual(err.name, 'GlyphExecutionError');
    assert.strictEqual(err.code, 'EXECUTION_ERROR');
});

test('GlyphTypeError has correct name', () => {
    const err = new GlyphTypeError('Type mismatch', {});
    assert.strictEqual(err.name, 'GlyphTypeError');
    assert.strictEqual(err.code, 'TYPE_ERROR');
});

test('GlyphDependencyError has correct name', () => {
    const err = new GlyphDependencyError('Dep failed', {});
    assert.strictEqual(err.name, 'GlyphDependencyError');
    assert.strictEqual(err.code, 'DEPENDENCY_ERROR');
});

test('Error toString includes code and details', () => {
    const err = new GlyphError('Test', 'V001', { id: 5 });
    const str = err.toString();
    assert.ok(str.includes('V001'));
    assert.ok(str.includes('Test'));
    assert.ok(str.includes('id'));
});

// ========== Error Factory Tests ==========
test('createError creates validation error for V codes', () => {
    const err = createError('V001', { id: 5 });
    assert.ok(err instanceof GlyphValidationError);
});

test('createError creates coherence error for C codes', () => {
    const err = createError('C001', {});
    assert.ok(err instanceof GlyphCoherenceError);
});

test('createError creates execution error for E codes', () => {
    const err = createError('E001', {});
    assert.ok(err instanceof GlyphExecutionError);
});

test('createError creates type error for T codes', () => {
    const err = createError('T001', {});
    assert.ok(err instanceof GlyphTypeError);
});

test('createError creates dependency error for D codes', () => {
    const err = createError('D001', {});
    assert.ok(err instanceof GlyphDependencyError);
});

test('createError includes error message from codes', () => {
    const err = createError('V001', { id: 5 });
    assert.ok(err.message.includes('Invalid glyph ID'));
});

// ========== Validator Tests ==========
test('Validator rejects null program', () => {
    const validator = new GlyphValidator();
    const result = validator.validateProgram(null);
    assert.strictEqual(result.valid, false);
    assert.ok(result.errors.length > 0);
    // Accept either specific code or generic validation error
    assert.ok(result.errors[0].code.startsWith('V') || result.errors[0].code === 'VALIDATION_ERROR');
});

test('Validator rejects program without glyphs', () => {
    const validator = new GlyphValidator();
    const result = validator.validateProgram({});
    assert.strictEqual(result.valid, false);
    assert.ok(result.errors.length > 0);
});

test('Validator accepts valid minimal program', () => {
    const validator = new GlyphValidator();
    const result = validator.validateProgram({
        glyphs: {
            "1": { stratum: "SUBSTRATE", opcode: "DATA", invariants: { value: 42 } }
        }
    });
    assert.strictEqual(result.valid, true);
    assert.strictEqual(result.errors.length, 0);
});

test('Validator rejects invalid stratum', () => {
    const validator = new GlyphValidator();
    const result = validator.validateProgram({
        glyphs: {
            "1": { stratum: "INVALID", opcode: "DATA" }
        }
    });
    assert.strictEqual(result.valid, false);
    assert.ok(result.errors.length > 0);
});

test('Validator rejects invalid opcode', () => {
    const validator = new GlyphValidator();
    const result = validator.validateProgram({
        glyphs: {
            "1": { stratum: "LOGIC", opcode: "INVALID_OP" }
        }
    });
    assert.strictEqual(result.valid, false);
    assert.ok(result.errors.length > 0);
});

test('Validator detects missing dependency', () => {
    const validator = new GlyphValidator();
    const result = validator.validateProgram({
        glyphs: {
            "1": { stratum: "LOGIC", opcode: "ADD", dependencies: [99] }
        }
    });
    assert.strictEqual(result.valid, false);
    assert.ok(result.errors.length > 0);
});

test('Validator detects self-reference', () => {
    const validator = new GlyphValidator();
    const result = validator.validateProgram({
        glyphs: {
            "1": { stratum: "LOGIC", opcode: "ADD", dependencies: [1] }
        }
    });
    assert.strictEqual(result.valid, false);
    assert.ok(result.errors.length > 0);
});

test('Validator accepts valid dependencies', () => {
    const validator = new GlyphValidator();
    const result = validator.validateProgram({
        glyphs: {
            "1": { stratum: "SUBSTRATE", opcode: "DATA", invariants: { value: 5 } },
            "2": { stratum: "LOGIC", opcode: "ADD", dependencies: [1] }
        }
    });
    assert.strictEqual(result.valid, true);
});

// ========== Coherence Validation Tests ==========
test('validateCoherence accepts downward dependencies', () => {
    const validator = new GlyphValidator();
    const result = validator.validateCoherence({
        glyphs: {
            "1": { stratum: "SUBSTRATE", opcode: "DATA" },
            "2": { stratum: "LOGIC", opcode: "ADD", dependencies: [1] }
        }
    });
    assert.strictEqual(result.valid, true);
    assert.strictEqual(result.errors.length, 0);
});

test('validateCoherence rejects upward dependencies', () => {
    const validator = new GlyphValidator();
    const result = validator.validateCoherence({
        glyphs: {
            "1": { stratum: "LOGIC", opcode: "ADD" },
            "2": { stratum: "SUBSTRATE", opcode: "DATA", dependencies: [1] }
        }
    });
    assert.strictEqual(result.valid, false);
    assert.ok(result.errors.length > 0);
});

test('validateCoherence accepts same-stratum dependencies', () => {
    const validator = new GlyphValidator();
    const result = validator.validateCoherence({
        glyphs: {
            "1": { stratum: "LOGIC", opcode: "ADD" },
            "2": { stratum: "LOGIC", opcode: "MUL", dependencies: [1] }
        }
    });
    assert.strictEqual(result.valid, true);
});

test('validateCoherence handles numeric strata', () => {
    const validator = new GlyphValidator();
    const result = validator.validateCoherence({
        glyphs: {
            "1": { stratum: 0, opcode: "DATA" },
            "2": { stratum: 2, opcode: "ADD", dependencies: [1] }
        }
    });
    assert.strictEqual(result.valid, true);
});

test('validateCoherence rejects upward with numeric strata', () => {
    const validator = new GlyphValidator();
    const result = validator.validateCoherence({
        glyphs: {
            "1": { stratum: 2, opcode: "ADD" },
            "2": { stratum: 0, opcode: "DATA", dependencies: [1] }
        }
    });
    assert.strictEqual(result.valid, false);
});

// ========== Error Code Tests ==========
test('ErrorCodes contains validation codes', () => {
    assert.ok(ErrorCodes.V001);
    assert.ok(ErrorCodes.V002);
    assert.ok(ErrorCodes.V003);
});

test('ErrorCodes contains coherence codes', () => {
    assert.ok(ErrorCodes.C001);
    assert.ok(ErrorCodes.C002);
    assert.ok(ErrorCodes.C003);
});

test('ErrorCodes contains execution codes', () => {
    assert.ok(ErrorCodes.E001);
    assert.ok(ErrorCodes.E002);
});

test('ErrorCodes contains type codes', () => {
    assert.ok(ErrorCodes.T001);
});

test('ErrorCodes contains dependency codes', () => {
    assert.ok(ErrorCodes.D001);
});

// ========== Summary ==========
console.log('\n' + '='.repeat(50));
console.log(`Tests: ${passed} passed, ${failed} failed`);
console.log('='.repeat(50));

process.exit(failed > 0 ? 1 : 0);
