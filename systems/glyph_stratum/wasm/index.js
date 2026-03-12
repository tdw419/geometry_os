/**
 * GlyphStratum Runtime
 * AI-native visual programming language with 5-layer stratum architecture
 *
 * @module glyph-stratum-runtime
 */

const { JsRuntime } = require('./glyph_runtime_f_fallback.js');
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
const viz = require('./visualize.js');

// Re-export all components
module.exports = {
    // Core runtime
    JsRuntime,

    // Error classes
    GlyphError,
    GlyphValidationError,
    GlyphCoherenceError,
    GlyphExecutionError,
    GlyphTypeError,
    GlyphDependencyError,

    // Error utilities
    ErrorCodes,
    createError,

    // Validator
    GlyphValidator,

    // Visualization
    visualize: viz
};

// Also export visualization functions directly
module.exports.renderASCII = viz.renderASCII;
module.exports.renderSVG = viz.renderSVG;
module.exports.renderMermaid = viz.renderMermaid;
module.exports.renderDOT = viz.renderDOT;
module.exports.renderToFile = viz.renderToFile;
module.exports.printVisualization = viz.printVisualization;
module.exports.STRATUM_COLORS = viz.STRATUM_COLORS;
