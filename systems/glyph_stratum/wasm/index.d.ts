/**
 * GlyphStratum Runtime - TypeScript Declarations
 */

// ============ Stratum Types ============

export type StratumName = 'SUBSTRATE' | 'MEMORY' | 'LOGIC' | 'SPEC' | 'INTENT';
export type StratumLevel = 0 | 2 | 3 | 4;

export interface StratumInfo {
    name: StratumName;
    level: StratumLevel;
    description: string;
}

// ============ Value Types ============

export type GlyphValueType = 'int' | 'float' | 'bool' | 'string' | 'array' | 'null';

export interface GlyphValue {
    type: GlyphValueType;
    value: number | string | boolean | GlyphValue[] | null;
}

// ============ Glyph Types ============

export interface Glyph {
    id: string | number;
    stratum: StratumName | StratumLevel;
    opcode: string;
    dependencies?: (string | number)[];
    invariants?: Record<string, unknown>;
}

export interface GlyphProgram {
    glyphs: Record<string, Glyph>;
    result?: string | number;
}

// ============ Runtime Types ============

export interface ExecutionResult {
    resultGlyph: string | number | null;
    resultValue: GlyphValue | null;
    glyphCount: number;
    executedCount: number;
}

export interface TraceStep {
    glyphId: string | number;
    opcode: string;
    executed: boolean;
    duration?: number;
}

export interface ExecutionTrace {
    trace: TraceStep[];
    glyphCount: number;
    result?: ExecutionResult;
}

export interface RuntimeStats {
    glyphCount: number;
    glyphsExecuted: number;
    cacheHitRate: string;
    executionTimeMs: number;
}

// ============ Error Types ============

export type ErrorCode =
    | 'V001' | 'V002' | 'V003' | 'V004' | 'V005' | 'V006' | 'V007'
    | 'C001' | 'C002' | 'C003' | 'C004'
    | 'E001' | 'E002' | 'E003'
    | 'T001' | 'T002'
    | 'D001' | 'D002';

export interface ErrorDetails {
    glyphId?: string | number;
    stratum?: StratumName;
    opcode?: string;
    expected?: string;
    actual?: string;
    dependency?: string | number;
    [key: string]: unknown;
}

export class GlyphError extends Error {
    code: ErrorCode;
    details: ErrorDetails;
    constructor(message: string, code: ErrorCode, details?: ErrorDetails);
    toString(): string;
}

export class GlyphValidationError extends GlyphError {}
export class GlyphCoherenceError extends GlyphError {}
export class GlyphExecutionError extends GlyphError {}
export class GlyphTypeError extends GlyphError {}
export class GlyphDependencyError extends GlyphError {}

// ============ Validator ============

export interface ValidationResult {
    valid: boolean;
    errors: GlyphError[];
    warnings?: GlyphError[];
}

export class GlyphValidator {
    validateProgram(program: GlyphProgram): ValidationResult;
    validateCoherence(program: GlyphProgram): ValidationResult;
    validateGlyph(glyph: Glyph, context: { glyphs: Record<string, Glyph> }): ValidationResult;
}

// ============ Runtime Class ============

export class JsRuntime {
    constructor();

    // Program management
    reset(): void;
    loadProgram(program: GlyphProgram): number;
    execute(): ExecutionResult;
    executeWithTrace(program: GlyphProgram): ExecutionTrace;

    // Glyph operations
    addGlyph(glyph: Glyph): void;
    executeGlyph(glyph: Glyph): boolean;
    computeExecutionOrder(): (string | number)[];

    // Value operations
    makeValue(type: GlyphValueType, value: unknown): GlyphValue | null;
    getValue(glyphId: string | number): GlyphValue | null;

    // Stats
    getStats(): RuntimeStats;

    // State
    glyphs: Record<string, Glyph>;
    values: GlyphValue[];
    halted: boolean;
    error: string | null;
    valueCount: number;
}

// ============ Visualization ============

export interface VisualizationOptions {
    maxWidth?: number;
    showValues?: boolean;
    width?: number;
    height?: number;
    nodeRadius?: number;
}

export interface StratumColor {
    ascii: string;
    hex: string;
    name: string;
}

export const STRATUM_COLORS: Record<StratumName, StratumColor>;

export function renderASCII(program: GlyphProgram, options?: VisualizationOptions): string;
export function renderSVG(program: GlyphProgram, options?: VisualizationOptions): string;
export function renderMermaid(program: GlyphProgram): string;
export function renderDOT(program: GlyphProgram): string;
export function renderToFile(program: GlyphProgram, outputPath: string, format?: 'ascii' | 'svg' | 'mermaid' | 'dot'): string;
export function printVisualization(program: GlyphProgram): void;

// ============ Error Factory ============

export function createError(code: ErrorCode, details?: ErrorDetails): GlyphError;

// ============ Error Codes ============

export const ErrorCodes: Record<ErrorCode, { code: ErrorCode; message: string }>;
