/**
 * GlyphStratum Error Classes
 * Custom error types for better error handling and debugging
 */

class GlyphError extends Error {
    constructor(message, code, details = {}) {
        super(message);
        this.name = 'GlyphError';
        this.code = code;
        this.details = details;
        this.timestamp = Date.now();
    }

    toString() {
        return `[${this.code}] ${this.message}${Object.keys(this.details).length > 0 ? ' | ' + JSON.stringify(this.details) : ''}`;
    }
}

class GlyphValidationError extends GlyphError {
    constructor(message, details = {}) {
        super(message, 'VALIDATION_ERROR', details);
        this.name = 'GlyphValidationError';
    }
}

class GlyphCoherenceError extends GlyphError {
    constructor(message, details = {}) {
        super(message, 'COHERENCE_ERROR', details);
        this.name = 'GlyphCoherenceError';
    }
}

class GlyphExecutionError extends GlyphError {
    constructor(message, details = {}) {
        super(message, 'EXECUTION_ERROR', details);
        this.name = 'GlyphExecutionError';
    }
}

class GlyphTypeError extends GlyphError {
    constructor(message, details = {}) {
        super(message, 'TYPE_ERROR', details);
        this.name = 'GlyphTypeError';
    }
}

class GlyphDependencyError extends GlyphError {
    constructor(message, details = {}) {
        super(message, 'DEPENDENCY_ERROR', details);
        this.name = 'GlyphDependencyError';
    }
}

// Error codes and messages
const ErrorCodes = {
    // Validation errors (V001-V099)
    V001: 'Invalid glyph ID',
    V002: 'Invalid stratum value',
    V003: 'Invalid opcode',
    V004: 'Missing required field',
    V005: 'Invalid value type',
    V006: 'Duplicate glyph ID',
    V007: 'Invalid JSON format',

    // Coherence errors (C001-C099)
    C001: 'Dependency points to non-existent glyph',
    C002: 'Upward dependency violates coherence rule',
    C003: 'Circular dependency detected',
    C004: 'Self-referential dependency',

    // Execution errors (E001-E099)
    E001: 'Division by zero',
    E002: 'Array index out of bounds',
    E003: 'Empty array pop',
    E004: 'Undefined variable',
    E005: 'Missing dependency value',
    E006: 'Loop iteration limit exceeded',
    E007: 'Memory allocation failed',

    // Type errors (T001-T099)
    T001: 'Type mismatch in operation',
    T002: 'Expected integer, got different type',
    T003: 'Expected array, got different type',
    T004: 'Expected string, got different type',
    T005: 'Cannot perform operation on nil value',

    // Dependency errors (D001-D099)
    D001: 'Dependency not yet executed',
    D002: 'Missing required dependency',
    D003: 'Too many dependencies for opcode'
};

// Helper function to create detailed error messages
function createError(code, context = {}) {
    const message = ErrorCodes[code] || 'Unknown error';
    const ErrorClass = {
        'V': GlyphValidationError,
        'C': GlyphCoherenceError,
        'E': GlyphExecutionError,
        'T': GlyphTypeError,
        'D': GlyphDependencyError
    }[code[0]] || GlyphError;

    return new ErrorClass(message, code, context);
}

// Validator class for program validation
class GlyphValidator {
    constructor() {
        this.errors = [];
        this.warnings = [];
    }

    validateProgram(program) {
        this.errors = [];
        this.warnings = [];

        if (!program || typeof program !== 'object') {
            this.errors.push(createError('V007', { input: typeof program }));
            return { valid: false, errors: this.errors, warnings: this.warnings };
        }

        if (!program.glyphs || typeof program.glyphs !== 'object') {
            this.errors.push(createError('V004', { field: 'glyphs', type: typeof program.glyphs }));
            return { valid: false, errors: this.errors, warnings: this.warnings };
        }

        const glyphIds = new Set();
        const validStrata = ['SUBSTRATE', 'MEMORY', 'LOGIC', 'SPEC', 'INTENT', 0, 1, 2, 3, 4];
        const validOpcodes = [
            'NOP', 'DATA', 'LOAD', 'STORE', 'ALLOC', 'FREE', 'CALL', 'BRANCH', 'LOOP',
            'RETURN', 'EXPORT', 'MODULE', 'HALT', 'ADD', 'SUB', 'MUL', 'DIV', 'MOD',
            'NEG', 'ABS', 'IF', 'IFTRUE', 'IFFALSE', 'EQ', 'NE', 'LT', 'LE', 'GT', 'GE',
            'CONCAT', 'LEN', 'SUBSTR', 'PUSH', 'POP', 'ARRAYLEN', 'GET', 'SET'
        ];

        // Validate each glyph
        for (const [id, glyph] of Object.entries(program.glyphs)) {
            // Check for duplicate IDs
            if (glyphIds.has(id)) {
                this.errors.push(createError('V006', { id }));
                continue;
            }
            glyphIds.add(id);

            // Validate stratum
            if (!validStrata.includes(glyph.stratum)) {
                this.errors.push(createError('V002', {
                    id,
                    stratum: glyph.stratum,
                    validOptions: validStrata
                }));
            }

            // Validate opcode
            if (!validOpcodes.includes(glyph.opcode)) {
                this.errors.push(createError('V003', {
                    id,
                    opcode: glyph.opcode,
                    validOptions: validOpcodes
                }));
            }

            // Validate dependencies
            if (glyph.dependencies) {
                if (!Array.isArray(glyph.dependencies)) {
                    this.errors.push(createError('V005', {
                        id,
                        field: 'dependencies',
                        expected: 'array',
                        got: typeof glyph.dependencies
                    }));
                } else {
                    // Check for self-reference
                    if (glyph.dependencies.includes(parseInt(id))) {
                        this.errors.push(createError('C004', { id }));
                    }
                }
            }

            // Validate invariants
            if (glyph.invariants && typeof glyph.invariants !== 'object') {
                this.errors.push(createError('V005', {
                    id,
                    field: 'invariants',
                    expected: 'object',
                    got: typeof glyph.invariants
                }));
            }
        }

        // Check for references to non-existent glyphs
        for (const [id, glyph] of Object.entries(program.glyphs)) {
            if (glyph.dependencies) {
                for (const dep of glyph.dependencies) {
                    if (!glyphIds.has(String(dep))) {
                        this.errors.push(createError('C001', {
                            glyph: id,
                            missingDependency: dep
                        }));
                    }
                }
            }
        }

        return {
            valid: this.errors.length === 0,
            errors: this.errors,
            warnings: this.warnings
        };
    }

    validateCoherence(program) {
        const coherenceErrors = [];
        const stratumOrder = { SUBSTRATE: 0, MEMORY: 1, LOGIC: 2, SPEC: 3, INTENT: 4 };

        for (const [id, glyph] of Object.entries(program.glyphs || {})) {
            if (!glyph.dependencies) continue;

            const glyphStratum = typeof glyph.stratum === 'string'
                ? stratumOrder[glyph.stratum]
                : glyph.stratum;

            for (const dep of glyph.dependencies) {
                const depGlyph = program.glyphs[String(dep)];
                if (!depGlyph) continue;

                const depStratum = typeof depGlyph.stratum === 'string'
                    ? stratumOrder[depGlyph.stratum]
                    : depGlyph.stratum;

                if (depStratum > glyphStratum) {
                    coherenceErrors.push(createError('C002', {
                        glyph: id,
                        glyphStratum: glyph.stratum,
                        dependency: dep,
                        dependencyStratum: depGlyph.stratum,
                        message: `Glyph ${id} (${glyph.stratum}) depends on higher stratum ${dep} (${depGlyph.stratum})`
                    }));
                }
            }
        }

        return {
            valid: coherenceErrors.length === 0,
            errors: coherenceErrors
        };
    }
}

module.exports = {
    GlyphError,
    GlyphValidationError,
    GlyphCoherenceError,
    GlyphExecutionError,
    GlyphTypeError,
    GlyphDependencyError,
    ErrorCodes,
    createError,
    GlyphValidator
};
