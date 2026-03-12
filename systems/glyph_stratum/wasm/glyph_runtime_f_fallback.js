/**
 * GlyphStratum Pure JS Runtime Fallback
 * JavaScript interpreter that runs glyph programs directly in the browser
 * when WASM is not available
 */

class JsRuntime {
    constructor() {
        this.glyphs = {}
        this.strataNames = ['SUBSTRATE', 'MEMORY', 'LOGIC', 'SPEC', 'INTENT']
        this.opcodeNames = [
            'NOP', 'DATA', 'LOAD', 'STORE', 'ALLOC', 'FREE', 'CALL', 'BRANCH', 'LOOP', 'RETURN', 'EXPORT', 'MODULE', 'HALT',
            // MATH opcodes
            'MATH', 'ADD', 'SUB', 'MUL', 'DIV', 'MOD', 'NEG', 'ABS',
            // BITWISE opcodes
            'BITAND', 'BITOR', 'BITXOR', 'BITNOT', 'SHIFTL', 'SHIFTR',
            // CONTROL FLOW opcodes
            'IF', 'IFTRUE', 'IFFALSE',
            // COMPARE opcodes
            'COMPARE', 'EQ', 'NE', 'LT', 'LE', 'GT', 'GE',
            // STRING opcodes
            'STRING', 'CONCAT', 'LEN', 'SUBSTR',
            // ARRAY opcodes
            'ARRAY', 'PUSH', 'POP', 'ARRAYLEN', 'GET', 'SET'
        ]
        this.strataOrder = {
            SUBSTRATE: 0,
            MEMORY: 1,
            LOGIC: 2,
            SPEC: 3,
            INTENT: 4
        }
        this.values = []
        this.valueCount = 0
        this.halted = false
        this.error = null
        this.resultValue = null
        this.lastResultGlyph = null

        // Performance optimizations
        this._glyphMap = new Map()      // Fast glyph lookup by ID
        this._valueCache = new Map()    // Cache computed values
        this._execOrderCache = null     // Cached execution order
        this._programHash = null        // Hash for cache invalidation
        this._stats = {
            cacheHits: 0,
            cacheMisses: 0,
            glyphsExecuted: 0,
            executionTimeMs: 0
        }
    }

    // ========== Value Management ==========
    makeValue(val) {
        // Check cache for immutable values (numbers, booleans, strings)
        const cacheKey = typeof val !== 'object' ? `${typeof val}:${val}` : null
        if (cacheKey && this._valueCache.has(cacheKey)) {
            this._stats.cacheHits++
            const cached = this._valueCache.get(cacheKey)
            return { ...cached }
        }

        let valueObj
        if (typeof val === 'number') {
            if (Number.isInteger(val)) {
                valueObj = { type: 'int', value: val }
            } else {
                valueObj = { type: 'float', value: val }
            }
        } else if (typeof val === 'boolean') {
            valueObj = { type: 'bool', value: val ? 1 : 0 }
        } else if (typeof val === 'string') {
            valueObj = { type: 'string', value: val }
        } else if (Array.isArray(val)) {
            valueObj = { type: 'array', value: val }
        } else if (typeof val === 'object' && val !== null) {
            valueObj = { type: 'array', value: val }
        } else {
            valueObj = { type: 'nil', value: null }
        }
        const idx = this.valueCount++
        this.values[idx] = valueObj

        // Cache immutable values
        if (cacheKey) {
            this._valueCache.set(cacheKey, { ...valueObj, valueIdx: idx })
            this._stats.cacheMisses++
        }

        return { ...valueObj, valueIdx: idx }
    }

    // ========== Glyph Management ==========
    addGlyph(id, stratum, opcode, valueIdx = 0) {
        if (this.glyphs[id]) {
            throw new Error(`Glyph ${id} already exists`)
        }
        const glyph = {
            id,
            stratum,
            opcode,
            valueIdx,
            dependencies: [],
            executed: false,
            hasResult: false
        }
        this.glyphs[id] = glyph
        return glyph
    }

    addDependency(glyphId, depId) {
        const glyph = this.glyphs[glyphId]
        if (!glyph) {
            throw new Error(`Glyph ${glyphId} not found`)
        }
        glyph.dependencies.push(depId)
    }

    // ========== Execution ==========
    computeExecutionOrder() {
        const order = []
        const remaining = new Set(Object.keys(this.glyphs))

        while (remaining.size > 0) {
            let changed = false
            for (const id of [...remaining]) {
                const glyph = this.glyphs[id]
                const deps = glyph.dependencies

                if (deps.every(dep => !remaining.has(dep.toString()))) {
                    order.push(id)
                    remaining.delete(id)
                    changed = true
                    break
                }
            }

            if (!changed) {
                // Circular dependency - add remaining
                for (const id of remaining) {
                    order.push(id)
                }
                break
            }
        }

        return order
    }

    executeGlyph(glyph) {
        if (glyph.executed) return

        glyph.executed = true
        glyph.hasResult = false

        switch (glyph.opcode.toLowerCase()) {
            case 'nop':
                break
            case 'halt':
                this.halted = true
                break
            case 'data':
                glyph.hasResult = true
                break
            case 'load':
                if (glyph.dependencies.length > 0) {
                    const depGlyph = this.glyphs[glyph.dependencies[0]]
                    if (depGlyph && depGlyph.hasResult) {
                        glyph.valueIdx = depGlyph.valueIdx
                        glyph.hasResult = true
                    }
                }
                break
            case 'store':
                glyph.hasResult = true
                break
            case 'alloc':
                if (glyph.dependencies.length > 0) {
                    const sizeGlyph = this.glyphs[glyph.dependencies[0]]
                    if (sizeGlyph && sizeGlyph.hasResult) {
                        const sizeVal = this.values[sizeGlyph.valueIdx]
                        if (sizeVal && sizeVal.type === 'int') {
                            const result = this.makeValue(new Array(sizeVal.value).fill(null))
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'free':
                glyph.hasResult = true
                break
            case 'call':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal && aVal.type === 'int' && bVal.type === 'int') {
                            const result = this.makeValue(aVal.value + bVal.value)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'branch':
                // BRANCH: conditional execution
                // deps[0]: condition (must be boolean)
                // deps[1]: true branch glyph id (executed if condition is true)
                // deps[2]: false branch glyph id (executed if condition is false)
                if (glyph.dependencies.length >= 3) {
                    const condGlyph = this.glyphs[glyph.dependencies[0]]
                    const trueGlyph = this.glyphs[glyph.dependencies[1]]
                    const falseGlyph = this.glyphs[glyph.dependencies[2]]
                    if (condGlyph && condGlyph.hasResult) {
                        const condVal = this.values[condGlyph.valueIdx]
                        if (condVal && condVal.type === 'bool') {
                            const selectedGlyph = condVal.value ? trueGlyph : falseGlyph
                            if (selectedGlyph) {
                                // Execute the selected branch
                                this.executeGlyph(selectedGlyph)
                                if (selectedGlyph.hasResult) {
                                    glyph.valueIdx = selectedGlyph.valueIdx
                                    glyph.hasResult = true
                                    glyph.branchResult = selectedGlyph.id
                                }
                            }
                        }
                    }
                }
                break
            case 'loop':
                // LOOP: iterate a body glyph N times
                // deps[0]: body glyph id
                // deps[1]: count (number of iterations)
                // invariants.initialValue: starting accumulator value
                if (glyph.dependencies.length >= 2) {
                    const bodyGlyph = this.glyphs[glyph.dependencies[0]]
                    const countGlyph = this.glyphs[glyph.dependencies[1]]
                    if (bodyGlyph && countGlyph && countGlyph.hasResult) {
                        const countVal = this.values[countGlyph.valueIdx]
                        if (countVal && (countVal.type === 'int' || countVal.type === 'float')) {
                                const iterations = countVal.value
                                // Get initial value from invariants
                                const inv = glyph.invariants || {}
                                let accumulator = inv.initialValue !== undefined ? inv.initialValue : null
                                for (let i = 0; i < iterations; i++) {
                                    // Reset body glyph for each iteration
                                    bodyGlyph.executed = false
                                    bodyGlyph.hasResult = false
                                    // Set up loop context for the body glyph
                                    if (accumulator !== null) {
                                        const accVal = this.makeValue(accumulator)
                                        bodyGlyph.loopAccumulator = accVal.valueIdx
                                    }
                                    this.executeGlyph(bodyGlyph)
                                    if (bodyGlyph.hasResult) {
                                        accumulator = this.values[bodyGlyph.valueIdx]?.value
                                    }
                                    if (this.halted) break
                                }
                                const resultVal = this.makeValue(accumulator)
                                glyph.valueIdx = resultVal.valueIdx
                                glyph.hasResult = true
                                glyph.loopResult = iterations
                            }
                        }
                    }
                break
            case 'return':
                if (glyph.dependencies.length > 0) {
                    const srcGlyph = this.glyphs[glyph.dependencies[0]]
                    if (srcGlyph && srcGlyph.hasResult) {
                        glyph.valueIdx = srcGlyph.valueIdx
                        glyph.hasResult = true
                        this.lastResultGlyph = glyph.id
                        this.resultValue = this.values[glyph.valueIdx]
                    }
                }
                break
            case 'export':
                glyph.hasResult = true
                break
            case 'module':
                glyph.hasResult = true
                break

            // MATH opcodes
            case 'add':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal) {
                            if (aVal.type === 'int' && bVal.type === 'int') {
                                const result = this.makeValue(aVal.value + bVal.value)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            } else if (aVal.type === 'float' && bVal.type === 'float') {
                                const result = this.makeValue(aVal.value + bVal.value)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            }
                        }
                    }
                }
                break
            case 'sub':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal) {
                            if (aVal.type === 'int' && bVal.type === 'int') {
                                const result = this.makeValue(aVal.value - bVal.value)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            } else if (aVal.type === 'float' && bVal.type === 'float') {
                                const result = this.makeValue(aVal.value - bVal.value)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            }
                        }
                    }
                }
                break
            case 'mul':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal) {
                            if (aVal.type === 'int' && bVal.type === 'int') {
                                const result = this.makeValue(aVal.value * bVal.value)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            } else if (aVal.type === 'float' && bVal.type === 'float') {
                                const result = this.makeValue(aVal.value * bVal.value)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            }
                        }
                    }
                }
                break
            case 'div':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal && bVal.value !== 0) {
                            if (aVal.type === 'int' && bVal.type === 'int') {
                                const result = this.makeValue(Math.floor(aVal.value / bVal.value))
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            } else if (aVal.type === 'float' && bVal.type === 'float') {
                                const result = this.makeValue(aVal.value / bVal.value)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            }
                        }
                    }
                }
                break
            case 'mod':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal && bVal.value !== 1 && aVal.type === 'int' && bVal.type === 'int') {
                            const result = this.makeValue(aVal.value % bVal.value)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'neg':
                if (glyph.dependencies.length >= 1) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    if (aGlyph && aGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        if (aVal) {
                            if (aVal.type === 'int') {
                                const result = this.makeValue(-aVal.value)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            } else if (aVal.type === 'float') {
                                const result = this.makeValue(-aVal.value)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            }
                        }
                    }
                }
                break
            case 'abs':
                if (glyph.dependencies.length >= 1) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    if (aGlyph && aGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        if (aVal) {
                            if (aVal.type === 'int') {
                                const result = this.makeValue(Math.abs(aVal.value))
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            } else if (aVal.type === 'float') {
                                const result = this.makeValue(Math.abs(aVal.value))
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            }
                        }
                    }
                }
                break

            // COMPARE opcodes
            case 'eq':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        let result = false
                        if (aVal.type === 'int' && bVal.type === 'int') {
                            result = aVal.value === bVal.value
                        } else if (aVal.type === 'float' && bVal.type === 'float') {
                            result = aVal.value === bVal.value
                        } else if (aVal.type === 'bool' && bVal.type === 'bool') {
                            result = aVal.value === bVal.value
                        } else if (aVal.type === 'string' && bVal.type === 'string') {
                            result = aVal.value === bVal.value
                        }
                        const eqResult = this.makeValue(result)
                        glyph.valueIdx = eqResult.valueIdx
                        glyph.hasResult = true
                    }
                }
                break
            case 'ne':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        let result = true
                        if (aVal.type === 'int' && bVal.type === 'int') {
                            result = aVal.value !== bVal.value
                        } else if (aVal.type === 'float' && bVal.type === 'float') {
                            result = aVal.value !== bVal.value
                        }
                        const resultVal = this.makeValue(result); glyph.valueIdx = resultVal.valueIdx
                        glyph.hasResult = true
                    }
                }
                break
            case 'lt':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        let result = false
                        if (aVal.type === 'int' && bVal.type === 'int') {
                            result = aVal.value < bVal.value
                        } else if (aVal.type === 'float' && bVal.type === 'float') {
                            result = aVal.value < bVal.value
                        }
                        const resultVal = this.makeValue(result); glyph.valueIdx = resultVal.valueIdx
                        glyph.hasResult = true
                    }
                }
                break
            case 'le':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        let result = false
                        if (aVal.type === 'int' && bVal.type === 'int') {
                            result = aVal.value <= bVal.value
                        } else if (aVal.type === 'float' && bVal.type === 'float') {
                            result = aVal.value <= bVal.value
                        }
                        const resultVal = this.makeValue(result); glyph.valueIdx = resultVal.valueIdx
                        glyph.hasResult = true
                    }
                }
                break
            case 'gt':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        let result = false
                        if (aVal.type === 'int' && bVal.type === 'int') {
                            result = aVal.value > bVal.value
                        } else if (aVal.type === 'float' && bVal.type === 'float') {
                            result = aVal.value > bVal.value
                        }
                        const resultVal = this.makeValue(result); glyph.valueIdx = resultVal.valueIdx
                        glyph.hasResult = true
                    }
                }
                break
            case 'ge':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        let result = false
                        if (aVal.type === 'int' && bVal.type === 'int') {
                            result = aVal.value >= bVal.value
                        } else if (aVal.type === 'float' && bVal.type === 'float') {
                            result = aVal.value >= bVal.value
                        }
                        const resultVal = this.makeValue(result); glyph.valueIdx = resultVal.valueIdx
                        glyph.hasResult = true
                    }
                }
                break

            // CONTROL FLOW opcodes
            case 'iftrue':
                if (glyph.dependencies.length >= 1) {
                    const condGlyph = this.glyphs[glyph.dependencies[0]]
                    if (condGlyph && condGlyph.hasResult) {
                        const condVal = this.values[condGlyph.valueIdx]
                        const resultVal = this.makeValue(condVal && condVal.value ? true : false)
                        glyph.valueIdx = resultVal.valueIdx
                        glyph.hasResult = true
                    }
                }
                break
            case 'iffalse':
                if (glyph.dependencies.length >= 1) {
                    const condGlyph = this.glyphs[glyph.dependencies[0]]
                    if (condGlyph && condGlyph.hasResult) {
                        const condVal = this.values[condGlyph.valueIdx]
                        const resultVal = this.makeValue(condVal && condVal.value === 0 ? true : false)
                        glyph.valueIdx = resultVal.valueIdx
                        glyph.hasResult = true
                    }
                }
                break

            // STRING opcodes
            case 'concat':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal && aVal.type === 'string' && bVal.type === 'string') {
                            const result = this.makeValue(aVal.value + bVal.value)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'len':
                if (glyph.dependencies.length >= 1) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    if (aGlyph && aGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        if (aVal) {
                            if (aVal.type === 'string') {
                                const result = this.makeValue(aVal.value.length)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            } else if (aVal.type === 'array') {
                                const result = this.makeValue(aVal.value.length)
                                glyph.valueIdx = result.valueIdx
                                glyph.hasResult = true
                            }
                        }
                    }
                }
                break
            case 'substr':
                if (glyph.dependencies.length >= 3) {
                    const strGlyph = this.glyphs[glyph.dependencies[0]]
                    const startGlyph = this.glyphs[glyph.dependencies[1]]
                    const lenGlyph = this.glyphs[glyph.dependencies[2]]
                    if (strGlyph && startGlyph && lenGlyph && strGlyph.hasResult && startGlyph.hasResult && lenGlyph.hasResult) {
                        const strVal = this.values[strGlyph.valueIdx]
                        const startVal = this.values[startGlyph.valueIdx]
                        const lenVal = this.values[lenGlyph.valueIdx]
                        if (strVal && startVal && lenVal && strVal.type === 'string' && startVal.type === 'int' && lenVal.type === 'int') {
                            const result = this.makeValue(strVal.value.substring(startVal.value, startVal.value + lenVal.value))
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break

            // ARRAY opcodes
            case 'push':
                if (glyph.dependencies.length >= 2) {
                    const arrGlyph = this.glyphs[glyph.dependencies[0]]
                    const elemGlyph = this.glyphs[glyph.dependencies[1]]
                    if (arrGlyph && elemGlyph && arrGlyph.hasResult && elemGlyph.hasResult) {
                        const arrVal = this.values[arrGlyph.valueIdx]
                        const elemVal = this.values[elemGlyph.valueIdx]
                        if (arrVal && elemVal && arrVal.type === 'array') {
                            arrVal.value.push(elemVal.value)
                            glyph.valueIdx = arrGlyph.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'pop':
                if (glyph.dependencies.length >= 1) {
                    const arrGlyph = this.glyphs[glyph.dependencies[0]]
                    if (arrGlyph && arrGlyph.hasResult) {
                        const arrVal = this.values[arrGlyph.valueIdx]
                        if (arrVal && arrVal.type === 'array' && arrVal.value.length > 0) {
                            const popped = arrVal.value.pop()
                            const result = this.makeValue(popped)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'arraylen':
                if (glyph.dependencies.length >= 1) {
                    const arrGlyph = this.glyphs[glyph.dependencies[0]]
                    if (arrGlyph && arrGlyph.hasResult) {
                        const arrVal = this.values[arrGlyph.valueIdx]
                        if (arrVal && arrVal.type === 'array') {
                            const result = this.makeValue(arrVal.value.length)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'get':
                if (glyph.dependencies.length >= 2) {
                    const arrGlyph = this.glyphs[glyph.dependencies[0]]
                    const idxGlyph = this.glyphs[glyph.dependencies[1]]
                    if (arrGlyph && idxGlyph && arrGlyph.hasResult && idxGlyph.hasResult) {
                        const arrVal = this.values[arrGlyph.valueIdx]
                        const idxVal = this.values[idxGlyph.valueIdx]
                        if (arrVal && idxVal && arrVal.type === 'array' && idxVal.type === 'int') {
                            const result = this.makeValue(arrVal.value[idxVal.value])
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'set':
                if (glyph.dependencies.length >= 3) {
                    const arrGlyph = this.glyphs[glyph.dependencies[0]]
                    const idxGlyph = this.glyphs[glyph.dependencies[1]]
                    const valGlyph = this.glyphs[glyph.dependencies[2]]
                    if (arrGlyph && idxGlyph && valGlyph && arrGlyph.hasResult && idxGlyph.hasResult && valGlyph.hasResult) {
                        const arrVal = this.values[arrGlyph.valueIdx]
                        const idxVal = this.values[idxGlyph.valueIdx]
                        const valVal = this.values[valGlyph.valueIdx]
                        if (arrVal && idxVal && valVal && arrVal.type === 'array' && idxVal.type === 'int') {
                            arrVal.value[idxVal.value] = valVal.value
                            glyph.valueIdx = arrGlyph.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break

            // BITWISE opcodes
            case 'bitand':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal && aVal.type === 'int' && bVal.type === 'int') {
                            const result = this.makeValue(aVal.value & bVal.value)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'bitor':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal && aVal.type === 'int' && bVal.type === 'int') {
                            const result = this.makeValue(aVal.value | bVal.value)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'bitxor':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal && aVal.type === 'int' && bVal.type === 'int') {
                            const result = this.makeValue(aVal.value ^ bVal.value)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'bitnot':
                if (glyph.dependencies.length >= 1) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    if (aGlyph && aGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        if (aVal && aVal.type === 'int') {
                            const result = this.makeValue(~aVal.value)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'shiftl':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal && aVal.type === 'int' && bVal.type === 'int') {
                            const result = this.makeValue(aVal.value << bVal.value)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
            case 'shiftr':
                if (glyph.dependencies.length >= 2) {
                    const aGlyph = this.glyphs[glyph.dependencies[0]]
                    const bGlyph = this.glyphs[glyph.dependencies[1]]
                    if (aGlyph && bGlyph && aGlyph.hasResult && bGlyph.hasResult) {
                        const aVal = this.values[aGlyph.valueIdx]
                        const bVal = this.values[bGlyph.valueIdx]
                        if (aVal && bVal && aVal.type === 'int' && bVal.type === 'int') {
                            const result = this.makeValue(aVal.value >>> bVal.value)
                            glyph.valueIdx = result.valueIdx
                            glyph.hasResult = true
                        }
                    }
                }
                break
        }

        this.lastResultGlyph = glyph.id
    }

    // ========== Execution Entry Points ==========
    execute() {
        const startTime = Date.now()
        this.halted = false
        this.error = null
        this._stats.glyphsExecuted = 0

        // Use cached execution order if available
        if (!this._execOrderCache) {
            this.computeExecutionOrder()
            this._execOrderCache = [...this.executionOrder]
        } else {
            this.executionOrder = this._execOrderCache
        }

        for (const idx of this.executionOrder) {
            const glyph = this.glyphs[idx]
            this.executeGlyph(glyph)
            this._stats.glyphsExecuted++

            if (this.halted) break
        }

        this._stats.executionTimeMs = Date.now() - startTime
        return this.getResult()
    }

    executeWithTrace(programJson) {
        const glyphCount = this.loadProgram(programJson)
        const trace = []

        // Execute
        this.execute()

        // Collect trace
        for (const glyph of Object.values(this.glyphs)) {
            trace.push({
                glyphId: glyph.id,
                stratum: this.strataNames[glyph.stratum],
                opcode: this.opcodeNames[glyph.opcode],
                executed: glyph.executed
            })
        }

        return {
            trace,
            glyphCount,
            coherence: this.checkCoherence(),
            result: this.getResult()
        }
    }

    // ========== Coherence Checking ==========
    checkCoherence() {
        const issues = []

        for (const glyph of Object.values(this.glyphs)) {
            const glyphStratum = glyph.stratum

            for (const depId of glyph.dependencies) {
                const depGlyph = this.glyphs[depId]
                if (depGlyph) {
                    const depStratum = depGlyph.stratum

                    // Coherence rule: dependencies must point downward (lower strata)
                    if (depStratum > glyphStratum) {
                        issues.push({
                            type: 'coherence',
                            message: `Glyph #${glyph.id} (${this.strataNames[glyph.stratum]}) depends on higher stratum #${depId} (${this.strataNames[depStratum]})`,
                            glyphId: glyph.id
                        })
                    }
                }
            }
        }

        return {
            valid: issues.length === 0,
            issues,
            coherencePercent: Object.keys(this.glyphs).length > 0 ?
                ((Object.keys(this.glyphs).length - issues.length) / Object.keys(this.glyphs).length * 100).toFixed(1) : 100
        }
    }

    // ========== Program Loading ==========
    loadProgram(programJson) {
        this.reset()
        const glyphs = programJson.glyphs || {}

        // First pass: create values and glyphs
        for (const [idStr, glyph] of Object.entries(glyphs)) {
            const id = parseInt(idStr)
            let valueIdx = 0

            // Create value if DATA glyph with invariants
            if (glyph.stratum === 0 && glyph.opcode === 'DATA') {
                const inv = glyph.invariants || {}
                if ('value' in inv) {
                    valueIdx = this.makeValue(inv.value).valueIdx
                }
            }

            this.addGlyph(id, glyph.stratum, glyph.opcode, valueIdx)
        }

        // Second pass: add dependencies
        for (const [idStr, glyph] of Object.entries(glyphs)) {
            const deps = glyph.dependencies || []
            for (const dep of deps) {
                this.addDependency(parseInt(idStr), dep)
            }
        }

        this.executionOrder = this.computeExecutionOrder()

        return Object.keys(glyphs).length
    }

    // ========== Reset ==========
    reset() {
        this.glyphs = {}
        this.values = []
        this.valueCount = 0
        this.halted = false
        this.error = null
        this.resultValue = null
        this.lastResultGlyph = null
        this.executionOrder = []

        // Clear performance caches
        this._glyphMap.clear()
        this._valueCache.clear()
        this._execOrderCache = null
        this._programHash = null
        this._stats = {
            cacheHits: 0,
            cacheMisses: 0,
            glyphsExecuted: 0,
            executionTimeMs: 0
        }
    }

    // ========== Performance Stats ==========
    getStats() {
        return {
            ...this._stats,
            glyphCount: Object.keys(this.glyphs).length,
            valueCount: this.valueCount,
            cacheHitRate: this._stats.cacheHits + this._stats.cacheMisses > 0
                ? (this._stats.cacheHits / (this._stats.cacheHits + this._stats.cacheMisses) * 100).toFixed(1) + '%'
                : '0%'
        }
    }

    // Fast glyph lookup using Map
    getGlyphById(id) {
        if (this._glyphMap.has(id)) {
            return this._glyphMap.get(id)
        }
        const glyph = this.glyphs[id]
        if (glyph) {
            this._glyphMap.set(id, glyph)
        }
        return glyph
    }

    // ========== Result Retrieval ==========
    getResult() {
        return {
            resultGlyph: this.lastResultGlyph,
            resultValue: this.resultValue,
            error: this.error
        }
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { JsRuntime }
}
