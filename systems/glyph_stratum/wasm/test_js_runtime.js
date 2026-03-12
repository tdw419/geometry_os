/**
 * GlyphStratum JS Runtime Tests
 * Run with: node test_js_runtime.js
 */

const assert = require('assert');
const { JsRuntime } = require('./glyph_runtime_f_fallback.js');

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

// ========== Value Management Tests ==========
test('makeValue creates integer value', () => {
    const rt = new JsRuntime();
    const val = rt.makeValue(42);
    assert.strictEqual(val.type, 'int');
    assert.strictEqual(val.value, 42);
    assert.strictEqual(rt.values[val.valueIdx].value, 42);
});

test('makeValue creates float value', () => {
    const rt = new JsRuntime();
    const val = rt.makeValue(3.14);
    assert.strictEqual(val.type, 'float');
    assert.strictEqual(val.value, 3.14);
});

test('makeValue creates boolean value', () => {
    const rt = new JsRuntime();
    const valTrue = rt.makeValue(true);
    const valFalse = rt.makeValue(false);
    assert.strictEqual(valTrue.type, 'bool');
    assert.strictEqual(valTrue.value, 1);
    assert.strictEqual(valFalse.value, 0);
});

test('makeValue creates string value', () => {
    const rt = new JsRuntime();
    const val = rt.makeValue('hello');
    assert.strictEqual(val.type, 'string');
    assert.strictEqual(val.value, 'hello');
});

test('makeValue creates array value', () => {
    const rt = new JsRuntime();
    const val = rt.makeValue([1, 2, 3]);
    assert.strictEqual(val.type, 'array');
    assert.deepStrictEqual(val.value, [1, 2, 3]);
});

// ========== Glyph Management Tests ==========
test('addGlyph creates glyph', () => {
    const rt = new JsRuntime();
    rt.addGlyph(1, 0, 'DATA', 0);
    assert.ok(rt.glyphs[1]);
    assert.strictEqual(rt.glyphs[1].stratum, 0);
    assert.strictEqual(rt.glyphs[1].opcode, 'DATA');
});

test('addGlyph throws on duplicate', () => {
    const rt = new JsRuntime();
    rt.addGlyph(1, 0, 'DATA', 0);
    assert.throws(() => rt.addGlyph(1, 0, 'DATA', 0), /already exists/);
});

test('addDependency adds dependency', () => {
    const rt = new JsRuntime();
    rt.addGlyph(1, 0, 'DATA', 0);
    rt.addGlyph(2, 2, 'ADD', 0);
    rt.addDependency(2, 1);
    assert.deepStrictEqual(rt.glyphs[2].dependencies, [1]);
});

// ========== Topological Sort Tests ==========
test('computeExecutionOrder handles simple chain', () => {
    const rt = new JsRuntime();
    rt.addGlyph(1, 0, 'DATA', 0);
    rt.addGlyph(2, 0, 'DATA', 0);
    rt.addGlyph(3, 2, 'ADD', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    const order = rt.computeExecutionOrder();
    assert.ok(order.indexOf('1') < order.indexOf('3'));
    assert.ok(order.indexOf('2') < order.indexOf('3'));
});

test('computeExecutionOrder handles longer chain', () => {
    const rt = new JsRuntime();
    rt.addGlyph(1, 0, 'DATA', 0);
    rt.addGlyph(2, 2, 'ADD', 0);
    rt.addGlyph(3, 2, 'ADD', 0);
    rt.addDependency(2, 1);
    rt.addDependency(3, 2);

    const order = rt.computeExecutionOrder();
    assert.strictEqual(order.indexOf('1') < order.indexOf('2'), true);
    assert.strictEqual(order.indexOf('2') < order.indexOf('3'), true);
});

// ========== MATH Opcode Tests ==========
test('ADD adds two integers', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(10);
    const v2 = rt.makeValue(5);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'ADD', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.glyphs[3].hasResult, true);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 15);
});

test('SUB subtracts two integers', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(10);
    const v2 = rt.makeValue(3);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'SUB', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 7);
});

test('MUL multiplies two integers', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(6);
    const v2 = rt.makeValue(7);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'MUL', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 42);
});

test('DIV divides two integers', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(20);
    const v2 = rt.makeValue(4);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'DIV', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 5);
});

test('DIV handles division by zero', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(10);
    const v2 = rt.makeValue(0);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'DIV', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    // Should not have result when dividing by zero
    assert.strictEqual(rt.glyphs[3].hasResult, false);
});

test('MOD computes modulo', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(17);
    const v2 = rt.makeValue(5);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'MOD', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 2);
});

test('NEG negates value', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(42);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 2, 'NEG', 0);
    rt.addDependency(2, 1);

    rt.executeGlyph(rt.glyphs[2]);
    assert.strictEqual(rt.values[rt.glyphs[2].valueIdx].value, -42);
});

test('ABS computes absolute value', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(-15);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 2, 'ABS', 0);
    rt.addDependency(2, 1);

    rt.executeGlyph(rt.glyphs[2]);
    assert.strictEqual(rt.values[rt.glyphs[2].valueIdx].value, 15);
});

// ========== COMPARE Opcode Tests ==========
test('EQ compares equality (true)', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(5);
    const v2 = rt.makeValue(5);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'EQ', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1); // true
});

test('EQ compares equality (false)', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(5);
    const v2 = rt.makeValue(3);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'EQ', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 0); // false
});

test('NE compares inequality', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(5);
    const v2 = rt.makeValue(3);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'NE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1); // true
});

test('LT compares less than', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(3);
    const v2 = rt.makeValue(5);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'LT', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('LE compares less than or equal', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(5);
    const v2 = rt.makeValue(5);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'LE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('GT compares greater than', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(10);
    const v2 = rt.makeValue(5);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'GT', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('GE compares greater than or equal', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(5);
    const v2 = rt.makeValue(5);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'GE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

// ========== STRING Opcode Tests ==========
test('CONCAT concatenates strings', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue('hello');
    const v2 = rt.makeValue(' world');

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'CONCAT', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 'hello world');
});

test('LEN returns string length', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue('hello');

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 2, 'LEN', 0);
    rt.addDependency(2, 1);

    rt.executeGlyph(rt.glyphs[2]);
    assert.strictEqual(rt.values[rt.glyphs[2].valueIdx].value, 5);
});

test('SUBSTR extracts substring', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue('hello world');
    const v2 = rt.makeValue(0);
    const v3 = rt.makeValue(5);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 0, 'DATA', v3.valueIdx);
    rt.glyphs[3].hasResult = true;
    rt.addGlyph(4, 2, 'SUBSTR', 0);
    rt.addDependency(4, 1);
    rt.addDependency(4, 2);
    rt.addDependency(4, 3);

    rt.executeGlyph(rt.glyphs[4]);
    assert.strictEqual(rt.values[rt.glyphs[4].valueIdx].value, 'hello');
});

// ========== ARRAY Opcode Tests ==========
test('PUSH adds element to array', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue([1, 2]);
    const v2 = rt.makeValue(3);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'PUSH', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.deepStrictEqual(rt.values[v1.valueIdx].value, [1, 2, 3]);
});

test('POP removes element from array', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue([1, 2, 3]);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 2, 'POP', 0);
    rt.addDependency(2, 1);

    rt.executeGlyph(rt.glyphs[2]);
    assert.strictEqual(rt.values[rt.glyphs[2].valueIdx].value, 3);
    assert.deepStrictEqual(rt.values[v1.valueIdx].value, [1, 2]);
});

test('ARRAYLEN returns array length', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue([1, 2, 3, 4]);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 2, 'ARRAYLEN', 0);
    rt.addDependency(2, 1);

    rt.executeGlyph(rt.glyphs[2]);
    assert.strictEqual(rt.values[rt.glyphs[2].valueIdx].value, 4);
});

test('GET retrieves array element', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(['a', 'b', 'c']);
    const v2 = rt.makeValue(1);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'GET', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 'b');
});

test('SET updates array element', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue([1, 2, 3]);
    const v2 = rt.makeValue(1);
    const v3 = rt.makeValue(99);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 0, 'DATA', v3.valueIdx);
    rt.glyphs[3].hasResult = true;
    rt.addGlyph(4, 2, 'SET', 0);
    rt.addDependency(4, 1);
    rt.addDependency(4, 2);
    rt.addDependency(4, 3);

    rt.executeGlyph(rt.glyphs[4]);
    assert.deepStrictEqual(rt.values[v1.valueIdx].value, [1, 99, 3]);
});

// ========== Program Loading Tests ==========
test('loadProgram loads JSON program', () => {
    const rt = new JsRuntime();
    const program = {
        glyphs: {
            1: { stratum: 0, opcode: 'DATA', invariants: { value: 10 } },
            2: { stratum: 0, opcode: 'DATA', invariants: { value: 20 } },
            3: { stratum: 2, opcode: 'ADD', dependencies: [1, 2] }
        }
    };

    const count = rt.loadProgram(program);
    assert.strictEqual(count, 3);
    assert.ok(rt.glyphs[1]);
    assert.ok(rt.glyphs[2]);
    assert.ok(rt.glyphs[3]);
});

test('executeWithTrace runs program and returns trace', () => {
    const rt = new JsRuntime();
    const program = {
        glyphs: {
            1: { stratum: 0, opcode: 'DATA', invariants: { value: 10 } },
            2: { stratum: 0, opcode: 'DATA', invariants: { value: 20 } },
            3: { stratum: 2, opcode: 'ADD', dependencies: [1, 2] }
        }
    };

    const result = rt.executeWithTrace(program);
    assert.strictEqual(result.glyphCount, 3);
    assert.strictEqual(result.trace.length, 3);
    assert.strictEqual(result.coherence.valid, true);
});

// ========== Coherence Tests ==========
test('checkCoherence passes for valid dependencies', () => {
    const rt = new JsRuntime();
    rt.addGlyph(1, 0, 'DATA', 0); // SUBSTRATE
    rt.addGlyph(2, 2, 'ADD', 0);  // LOGIC
    rt.addDependency(2, 1);        // LOGIC depends on SUBSTRATE (valid)

    const coherence = rt.checkCoherence();
    assert.strictEqual(coherence.valid, true);
    assert.strictEqual(coherence.issues.length, 0);
});

test('checkCoherence fails for upward dependencies', () => {
    const rt = new JsRuntime();
    rt.addGlyph(1, 2, 'ADD', 0);   // LOGIC (stratum 2)
    rt.addGlyph(2, 0, 'DATA', 0);  // SUBSTRATE (stratum 0)
    rt.addDependency(2, 1);         // SUBSTRATE depends on LOGIC (invalid!)

    const coherence = rt.checkCoherence();
    assert.strictEqual(coherence.valid, false);
    assert.strictEqual(coherence.issues.length, 1);
});

// ========== Full Integration Tests ==========
test('full program: arithmetic expression (10 + 5) * 2', () => {
    const rt = new JsRuntime();
    const program = {
        glyphs: {
            1: { stratum: 0, opcode: 'DATA', invariants: { value: 10 } },
            2: { stratum: 0, opcode: 'DATA', invariants: { value: 5 } },
            3: { stratum: 2, opcode: 'ADD', dependencies: [1, 2] },
            4: { stratum: 0, opcode: 'DATA', invariants: { value: 2 } },
            5: { stratum: 2, opcode: 'MUL', dependencies: [3, 4] }
        }
    };

    rt.loadProgram(program);
    rt.execute();

    // Glyph 5 should have result 30
    assert.strictEqual(rt.glyphs[5].hasResult, true);
    assert.strictEqual(rt.values[rt.glyphs[5].valueIdx].value, 30);
});

test('full program: string manipulation', () => {
    const rt = new JsRuntime();
    const program = {
        glyphs: {
            1: { stratum: 0, opcode: 'DATA', invariants: { value: 'Hello' } },
            2: { stratum: 0, opcode: 'DATA', invariants: { value: ', ' } },
            3: { stratum: 0, opcode: 'DATA', invariants: { value: 'World' } },
            4: { stratum: 2, opcode: 'CONCAT', dependencies: [1, 2] },
            5: { stratum: 2, opcode: 'CONCAT', dependencies: [4, 3] },
            6: { stratum: 2, opcode: 'LEN', dependencies: [5] }
        }
    };

    rt.loadProgram(program);
    rt.execute();

    // Glyph 5 should have "Hello, World", Glyph 6 should have length 12
    assert.strictEqual(rt.values[rt.glyphs[5].valueIdx].value, 'Hello, World');
    assert.strictEqual(rt.values[rt.glyphs[6].valueIdx].value, 12);
});

test('full program: array operations', () => {
    const rt = new JsRuntime();
    const program = {
        glyphs: {
            1: { stratum: 0, opcode: 'DATA', invariants: { value: [] } },
            2: { stratum: 0, opcode: 'DATA', invariants: { value: 1 } },
            3: { stratum: 0, opcode: 'DATA', invariants: { value: 2 } },
            4: { stratum: 2, opcode: 'PUSH', dependencies: [1, 2] },
            5: { stratum: 2, opcode: 'PUSH', dependencies: [4, 3] },
            6: { stratum: 2, opcode: 'ARRAYLEN', dependencies: [5] }
        }
    };

    rt.loadProgram(program);
    rt.execute();

    assert.strictEqual(rt.values[rt.glyphs[6].valueIdx].value, 2);
});

// ========== CONTROL FLOW Tests ==========
test('BRANCH selects true branch when condition is true', () => {
    const rt = new JsRuntime();
    const cond = rt.makeValue(true);
    const trueVal = rt.makeValue(42);
    const falseVal = rt.makeValue(0);

    rt.addGlyph(1, 0, 'DATA', cond.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', trueVal.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 0, 'DATA', falseVal.valueIdx);
    rt.glyphs[3].hasResult = true;
    rt.addGlyph(4, 2, 'BRANCH', 0);
    rt.addDependency(4, 1); // condition
    rt.addDependency(4, 2); // true branch
    rt.addDependency(4, 3); // false branch

    rt.executeGlyph(rt.glyphs[4]);

    assert.strictEqual(rt.glyphs[4].hasResult, true);
    assert.strictEqual(rt.values[rt.glyphs[4].valueIdx].value, 42);
    assert.strictEqual(rt.glyphs[4].branchResult, 2);
});

test('BRANCH selects false branch when condition is false', () => {
    const rt = new JsRuntime();
    const cond = rt.makeValue(false);
    const trueVal = rt.makeValue(42);
    const falseVal = rt.makeValue(0);

    rt.addGlyph(1, 0, 'DATA', cond.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', trueVal.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 0, 'DATA', falseVal.valueIdx);
    rt.glyphs[3].hasResult = true;
    rt.addGlyph(4, 2, 'BRANCH', 0);
    rt.addDependency(4, 1); // condition
    rt.addDependency(4, 2); // true branch
    rt.addDependency(4, 3); // false branch
    rt.executeGlyph(rt.glyphs[4]);

    assert.strictEqual(rt.glyphs[4].hasResult, true);
    assert.strictEqual(rt.values[rt.glyphs[4].valueIdx].value, 0);
    assert.strictEqual(rt.glyphs[4].branchResult, 3);
});

test('LOOP executes body N times', () => {
    const rt = new JsRuntime();
    const count = rt.makeValue(3);
    const start = rt.makeValue(0);

    rt.addGlyph(1, 0, 'DATA', count.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', start.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'ADD', 0); // body: increment counter
    rt.addDependency(3, 2);
    rt.addDependency(3, 1);
    rt.addGlyph(4, 2, 'LOOP', 0);
    rt.addDependency(4, 3); // body
    rt.addDependency(4, 1); // count

    rt.executeGlyph(rt.glyphs[4]);

    assert.strictEqual(rt.glyphs[4].hasResult, true);
    assert.strictEqual(rt.glyphs[4].loopResult, 3);
});

test('IFTRUE returns true value', () => {
    const rt = new JsRuntime();
    const val = rt.makeValue(100);

    rt.addGlyph(1, 0, 'DATA', val.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 2, 'IFTRUE', 0);
    rt.addDependency(2, 1);

    rt.executeGlyph(rt.glyphs[2]);
    assert.strictEqual(rt.glyphs[2].hasResult, true);
    assert.strictEqual(rt.values[rt.glyphs[2].valueIdx].value, 1);
});

test('IFFALSE returns true when value is zero', () => {
    const rt = new JsRuntime();
    const val = rt.makeValue(0);

    rt.addGlyph(1, 0, 'DATA', val.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 2, 'IFFALSE', 0);
    rt.addDependency(2, 1);

    rt.executeGlyph(rt.glyphs[2]);
    assert.strictEqual(rt.glyphs[2].hasResult, true);
    assert.strictEqual(rt.values[rt.glyphs[2].valueIdx].value, 1);
});

test('IFFALSE returns false when value is non-zero', () => {
    const rt = new JsRuntime();
    const val = rt.makeValue(42);

    rt.addGlyph(1, 0, 'DATA', val.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 2, 'IFFALSE', 0);
    rt.addDependency(2, 1);

    rt.executeGlyph(rt.glyphs[2]);
    assert.strictEqual(rt.glyphs[2].hasResult, true);
    assert.strictEqual(rt.values[rt.glyphs[2].valueIdx].value, 0);
});

// ========== Additional Comparison Tests ==========
test('NE compares not equal - true case', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(10);
    const v2 = rt.makeValue(5);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'NE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('NE compares not equal - false case', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(10);
    const v2 = rt.makeValue(10);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'NE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 0);
});

test('LE compares less or equal - true case (less)', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(5);
    const v2 = rt.makeValue(10);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'LE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('LE compares less or equal - true case (equal)', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(10);
    const v2 = rt.makeValue(10);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'LE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('LE compares less or equal - false case', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(15);
    const v2 = rt.makeValue(10);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'LE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 0);
});

test('GE compares greater or equal - true case (greater)', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(15);
    const v2 = rt.makeValue(10);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'GE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('GE compares greater or equal - true case (equal)', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(10);
    const v2 = rt.makeValue(10);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'GE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('GE compares greater or equal - false case', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(5);
    const v2 = rt.makeValue(10);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'GE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 0);
});

// ========== CALL Opcode Tests ==========
test('CALL invokes function glyph with args', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(5);
    const v2 = rt.makeValue(3);

    // Create function body (ADD operation)
    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'ADD', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    // CALL the function
    rt.addGlyph(4, 2, 'CALL', 0);
    rt.addDependency(4, 1);
    rt.addDependency(4, 2);

    rt.executeGlyph(rt.glyphs[3]);
    rt.executeGlyph(rt.glyphs[4]);

    assert.strictEqual(rt.glyphs[4].hasResult, true);
    assert.strictEqual(rt.values[rt.glyphs[4].valueIdx].value, 8);
});

// ========== Float Comparison Tests ==========
test('LE works with floats', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(3.14);
    const v2 = rt.makeValue(3.15);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'LE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('GE works with floats', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(3.15);
    const v2 = rt.makeValue(3.14);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'GE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

test('NE works with floats', () => {
    const rt = new JsRuntime();
    const v1 = rt.makeValue(3.14);
    const v2 = rt.makeValue(3.15);

    rt.addGlyph(1, 0, 'DATA', v1.valueIdx);
    rt.glyphs[1].hasResult = true;
    rt.addGlyph(2, 0, 'DATA', v2.valueIdx);
    rt.glyphs[2].hasResult = true;
    rt.addGlyph(3, 2, 'NE', 0);
    rt.addDependency(3, 1);
    rt.addDependency(3, 2);

    rt.executeGlyph(rt.glyphs[3]);
    assert.strictEqual(rt.values[rt.glyphs[3].valueIdx].value, 1);
});

// ========== Summary ==========
console.log('\n' + '='.repeat(50));
console.log(`Tests: ${passed} passed, ${failed} failed`);
console.log('='.repeat(50));

process.exit(failed > 0 ? 1 : 0);
