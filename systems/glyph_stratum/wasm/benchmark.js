/**
 * GlyphStratum Performance Benchmark
 * Run with: node benchmark.js
 */

const { JsRuntime } = require('./glyph_runtime_f_fallback.js');

function generateLargeProgram(size) {
    const glyphs = {};

    // Create DATA glyphs
    for (let i = 1; i <= size; i++) {
        glyphs[i] = {
            stratum: 0,
            opcode: 'DATA',
            invariants: { value: i }
        };
    }

    // Create ADD operations
    for (let i = 1; i <= size - 2; i++) {
        glyphs[size + i] = {
            stratum: 2,
            opcode: 'ADD',
            dependencies: [i, i + 1]
        };
    }

    return { glyphs };
}

function benchmark(name, fn, iterations = 100) {
    // Warmup
    for (let i = 0; i < 10; i++) fn();

    const start = process.hrtime.bigint();
    for (let i = 0; i < iterations; i++) {
        fn();
    }
    const end = process.hrtime.bigint();

    const totalMs = Number(end - start) / 1_000_000;
    const avgMs = totalMs / iterations;

    console.log(`${name}: ${avgMs.toFixed(3)}ms avg (${iterations} iterations, ${totalMs.toFixed(1)}ms total)`);
    return avgMs;
}

console.log('GlyphStratum Performance Benchmark\n');
console.log('='.repeat(50));

// Test different program sizes
const sizes = [10, 50, 100, 200, 500];

console.log('\n--- Execution Performance ---');
for (const size of sizes) {
    const program = generateLargeProgram(size);
    const rt = new JsRuntime();

    benchmark(`${size} glyphs`, () => {
        rt.reset();
        rt.loadProgram(program);
        rt.execute();
    }, 50);
}

console.log('\n--- Value Caching ---');
const rt = new JsRuntime();
benchmark('makeValue (cached integers)', () => {
    for (let i = 0; i < 100; i++) {
        rt.makeValue(i % 10); // Repeated values will hit cache
    }
}, 100);

const rt2 = new JsRuntime();
benchmark('makeValue (unique values)', () => {
    for (let i = 0; i < 100; i++) {
        rt2.makeValue(i + Math.random()); // Unique values, no cache hits
    }
}, 100);

console.log('\n--- Execution Order Caching ---');
const program = generateLargeProgram(100);
const rt3 = new JsRuntime();
rt3.loadProgram(program);

benchmark('First execution (builds cache)', () => {
    rt3.reset();
    rt3.loadProgram(program);
    rt3.execute();
}, 50);

benchmark('Subsequent executions (uses cache)', () => {
    rt3.reset();
    rt3.loadProgram(program);
    rt3.execute();
}, 50);

console.log('\n--- Stats from last run ---');
const stats = rt3.getStats();
console.log(`Cache hit rate: ${stats.cacheHitRate}`);
console.log(`Glyphs executed: ${stats.glyphsExecuted}`);
console.log(`Execution time: ${stats.executionTimeMs}ms`);

console.log('\n' + '='.repeat(50));
console.log('Benchmark complete');
