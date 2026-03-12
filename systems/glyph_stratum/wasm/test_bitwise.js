/**
 * Test bitwise opcodes
 */

const assert = require('assert');
const { JsRuntime } = require('./glyph_runtime_f_fallback.js');

// Test program with bitwise operations
const glyphProgram = {
    glyphs: {
        "1": {
            stratum: 0,
            opcode: "DATA",
            invariants: { value: 12 }
        },
        "2": {
            stratum: 0,
            opcode: "DATA",
            invariants: { value: 10 }
        },
        "3": {
            stratum: 2,
            opcode: "BITAND",
            dependencies: [1, 2]
        },
        "4": {
            stratum: 2,
            opcode: "BITOR",
            dependencies: [1, 2]
        },
        "5": {
            stratum: 2,
            opcode: "BITXOR",
            dependencies: [1, 2]
        },
        "6": {
            stratum: 2,
            opcode: "BITNOT",
            dependencies: [1]
        },
        "7": {
            stratum: 0,
            opcode: "DATA",
            invariants: { value: 2 }
        },
        "8": {
            stratum: 2,
            opcode: "SHIFTL",
            dependencies: [1, 7]
        },
        "9": {
            stratum: 2,
            opcode: "SHIFTR",
            dependencies: [1, 7]
        }
    }
};

const rt = new JsRuntime();
const glyphCount = rt.loadProgram(glyphProgram);
rt.execute();

// Verify glyph count
assert.ok(glyphCount >= 9, 'Should have at least 9 glyphs');

// Verify data glyphs
assert.ok(rt.glyphs[1].hasResult, 'Glyph 1 should have result');
assert.ok(rt.glyphs[2].hasResult, 'Glyph 2 should have result');
assert.strictEqual(rt.values[rt.glyphs[1].valueIdx].value, 12, 'Glyph 1 value should be 12');
assert.strictEqual(rt.values[rt.glyphs[2].valueIdx].value, 10, 'Glyph 2 value should be 10');

// Test BITAND: 12 & 10 = 8
assert.ok(rt.glyphs[3].hasResult, 'BITAND glyph should have result');
assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 8, '12 & 10 should equal 8');

// Test BITOR: 12 | 10 = 14
assert.ok(rt.glyphs[4].hasResult, 'BITOR glyph should have result');
assert.strictEqual(rt.values[rt.glyphs[4].valueIdx].value, 14, '12 | 10 should equal 14');

// Test BITXOR: 12 ^ 10 = 6
assert.ok(rt.glyphs[5].hasResult, 'BITXOR glyph should have result');
assert.strictEqual(rt.values[rt.glyphs[5].valueIdx].value, 6, '12 ^ 10 should equal 6');

// Test BITNOT: ~12 = -13 (JavaScript uses 32-bit signed integers)
assert.ok(rt.glyphs[6].hasResult, 'BITNOT glyph should have result');
assert.strictEqual(rt.values[rt.glyphs[6].valueIdx].value, -13, '~12 should equal -13');

// Test SHIFTL: 12 << 2 = 48
assert.ok(rt.glyphs[8].hasResult, 'SHIFTL glyph should have result');
assert.strictEqual(rt.values[rt.glyphs[8].valueIdx].value, 48, '12 << 2 should equal 48');

// Test SHIFTR: 12 >>> 2 = 3 (unsigned right shift)
assert.ok(rt.glyphs[9].hasResult, 'SHIFTR glyph should have result');
assert.strictEqual(rt.values[rt.glyphs[9].valueIdx].value, 3, '12 >>> 2 should equal 3');

console.log('✓ All 7 bitwise tests passed');
console.log('  - BITAND: 12 & 10 = 8');
console.log('  - BITOR: 12 | 10 = 14');
console.log('  - BITXOR: 12 ^ 10 = 6');
console.log('  - BITNOT: ~12 = -13');
console.log('  - SHIFTL: 12 << 2 = 48');
console.log('  - SHIFTR: 12 >>> 2 = 3');
console.log('✓ Bitwise opcodes added to GlyphStratum!');
