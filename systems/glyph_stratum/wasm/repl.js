#!/usr/bin/env node
/**
 * GlyphStratum REPL
 * Interactive command-line runtime for glyph programs
 *
 * Usage: node repl.js [program.glyph]
 */

const readline = require('readline');
const fs = require('fs');
const path = require('path');
const { JsRuntime } = require('./glyph_runtime_f_fallback.js');
const { GlyphValidator } = require('./glyph_errors.js');
const viz = require('./visualize.js');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const runtime = new JsRuntime();
const validator = new GlyphValidator();

let currentProgram = null;
let history = [];

// ANSI colors
const colors = {
    reset: '\x1b[0m',
    bold: '\x1b[1m',
    dim: '\x1b[2m',
    red: '\x1b[31m',
    green: '\x1b[32m',
    yellow: '\x1b[33m',
    blue: '\x1b[34m',
    magenta: '\x1b[35m',
    cyan: '\x1b[36m',
    white: '\x1b[37m'
};

function colorize(text, color) {
    return `${colors[color] || ''}${text}${colors.reset}`;
}

function printHelp() {
    console.log(`
${colorize('GlyphStratum REPL', 'bold')} ${colorize('v0.2.0', 'dim')}

${colorize('Commands:', 'cyan')}
  ${colorize('help', 'yellow')}              Show this help message
  ${colorize('load <file>', 'yellow')}       Load a .glyph program file
  ${colorize('run', 'yellow')}               Execute the loaded program
  ${colorize('step', 'yellow')}              Execute one glyph at a time
  ${colorize('reset', 'yellow')}             Reset execution state
  ${colorize('status', 'yellow')}            Show program status
  ${colorize('glyphs', 'yellow')}            List all glyphs
  ${colorize('glyph <id>', 'yellow')}        Show glyph details
  ${colorize('deps <id>', 'yellow')}         Show glyph dependencies
  ${colorize('value <id>', 'yellow')}        Get glyph result value
  ${colorize('trace', 'yellow')}             Show execution trace
  ${colorize('viz', 'yellow')}               Visualize program (ASCII)
  ${colorize('validate', 'yellow')}          Validate program
  ${colorize('coherence', 'yellow')}         Check strata coherence
  ${colorize('stats', 'yellow')}             Show performance stats
  ${colorize('clear', 'yellow')}             Clear screen
  ${colorize('exit', 'yellow')}              Exit REPL

${colorize('Strata:', 'cyan')}
  ${colorize('SUBSTRATE', 'blue')} (0) - Raw data values
  ${colorize('MEMORY', 'green')} (1) - Named storage
  ${colorize('LOGIC', 'yellow')} (2) - Computation
  ${colorize('SPEC', 'magenta')} (3) - Specifications
  ${colorize('INTENT', 'red')} (4) - High-level goals

${colorize('Examples:', 'cyan')}
  > load examples/factorial.glyph
  > run
  > value 18
  > stats
`);
}

function prompt() {
    rl.setPrompt(`${colorize('glyph', 'cyan')}> `);
    rl.prompt();
}

function loadProgram(filepath) {
    try {
        const fullPath = path.resolve(filepath);
        const content = fs.readFileSync(fullPath, 'utf8');
        currentProgram = JSON.parse(content);

        runtime.reset();
        const count = runtime.loadProgram(currentProgram);

        console.log(`${colorize('✓', 'green')} Loaded ${count} glyphs from ${filepath}`);
        return true;
    } catch (err) {
        console.log(`${colorize('✗', 'red')} Error loading program: ${err.message}`);
        return false;
    }
}

function runProgram() {
    if (!currentProgram) {
        console.log(`${colorize('✗', 'red')} No program loaded. Use 'load <file>' first.`);
        return;
    }

    const start = Date.now();
    const result = runtime.execute();
    const elapsed = Date.now() - start;

    console.log(`${colorize('✓', 'green')} Executed in ${elapsed}ms`);
    console.log(`Result glyph: ${result.resultGlyph}`);
    if (result.resultValue) {
        console.log(`Result value: ${JSON.stringify(result.resultValue.value)}`);
    }
}

function stepProgram() {
    if (!currentProgram) {
        console.log(`${colorize('✗', 'red')} No program loaded. Use 'load <file>' first.`);
        return;
    }

    // Simple step - just run and show first unexecuted
    const order = runtime.computeExecutionOrder();
    let stepped = false;

    for (const id of order) {
        const glyph = runtime.glyphs[id];
        if (!glyph.executed) {
            runtime.executeGlyph(glyph);
            console.log(`${colorize('→', 'yellow')} Executed glyph ${id} (${glyph.opcode})`);
            if (glyph.hasResult) {
                const val = runtime.values[glyph.valueIdx];
                console.log(`  Result: ${JSON.stringify(val?.value)}`);
            }
            stepped = true;
            break;
        }
    }

    if (!stepped) {
        console.log(`${colorize('✓', 'green')} All glyphs executed`);
    }
}

function showStatus() {
    if (!currentProgram) {
        console.log(`${colorize('✗', 'red')} No program loaded`);
        return;
    }

    const glyphs = Object.values(runtime.glyphs);
    const executed = glyphs.filter(g => g.executed).length;
    const total = glyphs.length;

    console.log(`
${colorize('Program Status', 'bold')}
  Glyphs: ${executed}/${total} executed
  Values: ${runtime.valueCount}
  Halted: ${runtime.halted ? colorize('Yes', 'red') : colorize('No', 'green')}
  Error: ${runtime.error ? colorize(runtime.error, 'red') : colorize('None', 'green')}
`);
}

function listGlyphs() {
    if (!currentProgram) {
        console.log(`${colorize('✗', 'red')} No program loaded`);
        return;
    }

    console.log(`\n${colorize('Glyphs:', 'bold')}`);
    for (const [id, glyph] of Object.entries(runtime.glyphs)) {
        const status = glyph.executed ? colorize('✓', 'green') : colorize('○', 'dim');
        const stratum = colorize(glyph.stratum, 'cyan');
        console.log(`  ${status} [${id}] ${stratum} ${glyph.opcode}`);
    }
}

function showGlyph(id) {
    const glyph = runtime.glyphs[id];
    if (!glyph) {
        console.log(`${colorize('✗', 'red')} Glyph ${id} not found`);
        return;
    }

    console.log(`
${colorize(`Glyph ${id}`, 'bold')}
  Stratum: ${colorize(glyph.stratum, 'cyan')}
  Opcode: ${colorize(glyph.opcode, 'yellow')}
  Dependencies: ${glyph.dependencies?.join(', ') || 'none'}
  Executed: ${glyph.executed ? colorize('Yes', 'green') : colorize('No', 'dim')}
  Has Result: ${glyph.hasResult ? colorize('Yes', 'green') : colorize('No', 'dim')}
`);

    if (glyph.hasResult && glyph.valueIdx !== undefined) {
        const val = runtime.values[glyph.valueIdx];
        console.log(`  Value: ${JSON.stringify(val)}`);
    }
}

function showValue(id) {
    const glyph = runtime.glyphs[id];
    if (!glyph) {
        console.log(`${colorize('✗', 'red')} Glyph ${id} not found`);
        return;
    }

    if (!glyph.hasResult) {
        console.log(`${colorize('✗', 'yellow')} Glyph ${id} has no result yet`);
        return;
    }

    const val = runtime.values[glyph.valueIdx];
    if (!val) {
        console.log(`${colorize('✗', 'red')} No value at index ${glyph.valueIdx}`);
        return;
    }

    console.log(`${colorize(`Value for glyph ${id}:`, 'bold')}`);
    console.log(`  Type: ${val.type}`);
    console.log(`  Value: ${JSON.stringify(val.value)}`);
}

function showStats() {
    const stats = runtime.getStats();
    console.log(`
${colorize('Performance Stats', 'bold')}
  Glyphs: ${stats.glyphCount}
  Executed: ${stats.glyphsExecuted}
  Cache Hit Rate: ${stats.cacheHitRate}
  Execution Time: ${stats.executionTimeMs}ms
`);
}

function showTrace() {
    if (!currentProgram) {
        console.log(`${colorize('✗', 'red')} No program loaded`);
        return;
    }

    const result = runtime.executeWithTrace(currentProgram);
    console.log(`\n${colorize('Execution Trace:', 'bold')}`);
    for (const step of result.trace) {
        const status = step.executed ? colorize('✓', 'green') : colorize('○', 'dim');
        console.log(`  ${status} [${step.glyphId}] ${step.opcode}`);
    }
}

function showViz() {
    if (!currentProgram) {
        console.log(`${colorize('✗', 'red')} No program loaded`);
        return;
    }
    console.log(viz.renderASCII(currentProgram));
}

function validateProgram() {
    if (!currentProgram) {
        console.log(`${colorize('✗', 'red')} No program loaded`);
        return;
    }

    const result = validator.validateProgram(currentProgram);
    if (result.errors.length === 0) {
        console.log(`${colorize('✓', 'green')} Program is valid`);
    } else {
        console.log(`${colorize('✗', 'red')} Validation errors:`);
        for (const err of result.errors) {
            console.log(`  - ${err.toString()}`);
        }
    }
}

function checkCoherence() {
    if (!currentProgram) {
        console.log(`${colorize('✗', 'red')} No program loaded`);
        return;
    }

    const result = validator.validateCoherence(currentProgram);
    if (result.valid) {
        console.log(`${colorize('✓', 'green')} Strata coherence check passed`);
    } else {
        console.log(`${colorize('✗', 'red')} Coherence violations:`);
        for (const err of result.errors) {
            console.log(`  - ${err.toString()}`);
        }
    }
}

// Handle commands
function handleCommand(input) {
    const trimmed = input.trim();
    if (!trimmed) {
        prompt();
        return;
    }

    history.push(trimmed);

    const parts = trimmed.split(/\s+/);
    const cmd = parts[0].toLowerCase();
    const args = parts.slice(1);

    switch (cmd) {
        case 'help':
        case '?':
            printHelp();
            break;
        case 'load':
            if (args[0]) {
                loadProgram(args[0]);
            } else {
                console.log(`${colorize('Usage:', 'yellow')} load <file.glyph>`);
            }
            break;
        case 'run':
            runProgram();
            break;
        case 'step':
            stepProgram();
            break;
        case 'reset':
            runtime.reset();
            console.log(`${colorize('✓', 'green')} Execution state reset`);
            break;
        case 'status':
            showStatus();
            break;
        case 'glyphs':
        case 'ls':
            listGlyphs();
            break;
        case 'glyph':
            if (args[0]) {
                showGlyph(args[0]);
            } else {
                console.log(`${colorize('Usage:', 'yellow')} glyph <id>`);
            }
            break;
        case 'deps':
            if (args[0]) {
                showGlyph(args[0]);
            } else {
                console.log(`${colorize('Usage:', 'yellow')} deps <id>`);
            }
            break;
        case 'value':
        case 'get':
            if (args[0]) {
                showValue(args[0]);
            } else {
                console.log(`${colorize('Usage:', 'yellow')} value <id>`);
            }
            break;
        case 'trace':
            showTrace();
            break;
        case 'viz':
        case 'visualize':
            showViz();
            break;
        case 'validate':
            validateProgram();
            break;
        case 'coherence':
            checkCoherence();
            break;
        case 'stats':
            showStats();
            break;
        case 'clear':
            console.clear();
            console.log(`${colorize('GlyphStratum REPL', 'bold')} ${colorize('v0.2.0', 'dim')} - Type 'help' for commands`);
            break;
        case 'exit':
        case 'quit':
        case 'q':
            console.log(`${colorize('Goodbye!', 'green')}`);
            rl.close();
            return;
        default:
            console.log(`${colorize('Unknown command:', 'red')} ${cmd}. Type 'help' for commands.`);
    }

    prompt();
}

// Main
console.log(`${colorize('GlyphStratum REPL', 'bold')} ${colorize('v0.2.0', 'dim')}`);
console.log(`Type ${colorize('help', 'yellow')} for commands, ${colorize('exit', 'yellow')} to quit\n`);

// Load file if provided
if (process.argv[2]) {
    loadProgram(process.argv[2]);
}

rl.on('line', handleCommand);
rl.on('close', () => process.exit(0));

prompt();
