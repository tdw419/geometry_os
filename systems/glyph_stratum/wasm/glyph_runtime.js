/**
 * GlyphStratum WebAssembly Runtime
 *
 * JavaScript wrapper for loading and running the WASM-based glyph executor.
 */

class WasmRuntime {
    constructor() {
        this.module = null;
        this.memory = null;
        this.ready = false;
        this.strataNames = ['SUBSTRATE', 'MEMORY', 'LOGIC', 'SPEC', 'INTENT'];
        this.opcodeNames = ['NOP', 'DATA', 'LOAD', 'STORE', 'ALLOC', 'FREE', 'CALL', 'BRANCH', 'LOOP', 'RETURN', 'EXPORT', 'MODULE', 'HALT', 'MATH', 'add', 'sub', 'mul', 'div', 'mod', 'neg', 'abs', 'COMPARE', 'eq', 'ne', 'lt', 'le', 'gt', 'ge', 'STRING', 'concat', 'len', 'substr', 'ARRAY', 'push', 'pop', 'arraylen', 'get', 'set'];
    }

    /**
     * Load the WebAssembly module
     */
    async load(wasmPath = 'glyph_runtime.wasm') {
        try {
            const response = await fetch(wasmPath);
            const bytes = await response.arrayBuffer();
            this.module = await WebAssembly.instantiate(bytes, {
                env: {
                    memory: new WebAssembly.Memory({ initial: 256 })
                }
            });
            this.memory = this.module.instance.exports.memory;
            this.ready = true;

            // Initialize
            this.call('glyph_init');

            return true;
        } catch (error) {
            console.error('Failed to load WASM:', error);
            return false;
        }
    }

    /**
     * Call a WASM function
     */
    call(funcName, ...args) {
        if (!this.ready) {
            throw new Error('WASM not loaded');
        }
        const func = this.module.instance.exports[funcName];
        if (!func) {
            throw new Error(`Function ${funcName} not found`);
        }
        return func(...args);
    }

    /**
     * Clear all glyphs and reset
     */
    clear() {
        this.call('glyph_clear');
    }

    /**
     * Reset execution state (keep glyphs)
     */
    reset() {
        this.call('glyph_reset');
    }

    /**
     * Add a glyph
     */
    addGlyph(id, stratum, opcode, valueIdx = 0) {
        const stratumNum = this.strataNames.indexOf(stratum);
        const opcodeNum = this.opcodeNames.indexOf(opcode);

        if (stratumNum < 0 || opcodeNum < 0) {
            throw new Error(`Invalid stratum or opcode: ${stratum}, ${opcode}`);
        }

        return this.call('glyph_add', id, stratumNum + 1, opcodeNum + 1, valueIdx);
    }

    /**
     * Add dependency to last glyph
     */
    addDependency(depId) {
        return this.call('glyph_add_dep', depId);
    }

    /**
     * Create integer value
     */
    makeInt(value) {
        return this.call('glyph_make_int', value);
    }

    /**
     * Create float value
     */
    makeFloat(value) {
        return this.call('glyph_make_float', value);
    }

    /**
     * Create boolean value
     */
    makeBool(value) {
        return this.call('glyph_make_bool', value ? 1 : 0);
    }

    /**
     * Get value type
     */
    getType(valueIdx) {
        return this.call('glyph_get_type', valueIdx);
    }

    /**
     * Get integer value
     */
    getInt(valueIdx) {
        return this.call('glyph_get_int', valueIdx);
    }

    /**
     * Get float value
     */
    getFloat(valueIdx) {
        return this.call('glyph_get_float', valueIdx);
    }

    /**
     * Execute all glyphs
     */
    execute() {
        const error = this.call('glyph_execute');
        return {
            error,
            resultGlyph: this.call('glyph_get_result_glyph'),
            resultValue: this.call('glyph_get_result_value')
        };
    }

    /**
     * Get glyph count
     */
    getGlyphCount() {
        return this.call('glyph_get_count');
    }

    /**
     * Get glyph info
     */
    getGlyphInfo(idx) {
        return {
            id: this.call('glyph_get_id', idx),
            stratum: this.strataNames[this.call('glyph_get_stratum', idx) - 1],
            opcode: this.opcodeNames[this.call('glyph_get_opcode', idx) - 1],
            executed: this.call('glyph_is_executed', idx) === 1
        };
    }

    /**
     * Load program from JSON
     */
    loadProgram(programJson) {
        this.clear();

        const glyphs = programJson.glyphs || {};
        const glyphList = [];

        // First pass: create values and glyphs
        for (const [idStr, glyph] of Object.entries(glyphs)) {
            const id = parseInt(idStr);
            let valueIdx = 0;

            // Create value if DATA glyph with invariants
            if (glyph.stratum === 'SUBSTRATE' && glyph.opcode === 'DATA') {
                const inv = glyph.invariants || {};
                if ('value' in inv) {
                    if (typeof inv.value === 'number') {
                        if (Number.isInteger(inv.value)) {
                            valueIdx = this.makeInt(inv.value);
                        } else {
                            valueIdx = this.makeFloat(inv.value);
                        }
                    } else if (typeof inv.value === 'boolean') {
                        valueIdx = this.makeBool(inv.value);
                    }
                }
            }

            const result = this.addGlyph(id, glyph.stratum, glyph.opcode, valueIdx);
            glyphList.push({ id, glyph, valueIdx });
        }

        // Second pass: add dependencies
        for (const { id, glyph } of glyphList) {
            // Re-add the glyph to set it as current
            const deps = glyph.dependencies || [];
            for (const dep of deps) {
                this.addDependency(dep);
            }
        }

        return glyphList.length;
    }

    /**
     * Execute program and get trace
     */
    executeWithTrace(programJson) {
        const glyphCount = this.loadProgram(programJson);
        const trace = [];

        // Execute
        const result = this.execute();

        // Collect execution info
        for (let i = 0; i < this.getGlyphCount(); i++) {
            const info = this.getGlyphInfo(i);
            trace.push({
                glyphId: info.id,
                stratum: info.stratum,
                opcode: info.opcode,
                executed: info.executed
            });
        }

        return {
            trace,
            result,
            glyphCount
        };
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WasmRuntime };
}
