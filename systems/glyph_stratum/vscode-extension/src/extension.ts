import * as vscode from 'vscode';
import { GlyphPreviewProvider } from './previewProvider';

let previewProvider: GlyphPreviewProvider;

export function activate(context: vscode.ExtensionContext) {
    console.log('GlyphStratum extension is now active');

    // Register preview provider
    previewProvider = new GlyphPreviewProvider(context);

    // Register preview command
    const previewCommand = vscode.commands.registerCommand('glyph.preview', () => {
        const editor = vscode.window.activeTextEditor;
        if (editor) {
            previewProvider.showPreview(editor.document);
        }
    });

    // Register execute command
    const executeCommand = vscode.commands.registerCommand('glyph.execute', () => {
        const editor = vscode.window.activeTextEditor;
        if (editor) {
            executeProgram(editor.document);
        }
    });

    // Register document change listener
    const changeDocumentListener = vscode.workspace.onDidChangeTextDocument((e) => {
        if (e.document.languageId === 'glyph' && previewProvider.isVisible()) {
            previewProvider.updatePreview(e.document);
        }
    });

    context.subscriptions.push(previewCommand, executeCommand, changeDocumentListener);
}

async function executeProgram(document: vscode.TextDocument): Promise<void> {
    try {
        const content = document.getText();
        const program = JSON.parse(content);

        // Create execution trace
        const trace = executeGlyphProgram(program);

        // Show output
        const outputChannel = vscode.window.createOutputChannel('GlyphStratum Execution');
        outputChannel.clear();
        outputChannel.appendLine('=== GlyphStratum Execution ===\n');
        outputChannel.appendLine(`Glyphs: ${trace.glyphCount}`);
        outputChannel.appendLine(`Result: ${JSON.stringify(trace.result, null, 2)}`);
        outputChannel.appendLine('\n--- Execution Trace ---');
        for (const step of trace.trace) {
            const status = step.executed ? '✓' : '✗';
            outputChannel.appendLine(`${status} [${step.stratum}] ${step.opcode} (id: ${step.glyphId})`);
        }
        outputChannel.show();

    } catch (error) {
        vscode.window.showErrorMessage(`Execution error: ${error}`);
    }
}

interface Glyph {
    stratum: string;
    opcode: string;
    dependencies?: number[];
    invariants?: Record<string, unknown>;
}

interface GlyphProgram {
    glyphs: Record<string, Glyph>;
}

interface ExecutionStep {
    glyphId: number;
    stratum: string;
    opcode: string;
    executed: boolean;
    value?: unknown;
}

interface ExecutionTrace {
    glyphCount: number;
    result: { error: number; resultGlyph: number; resultValue: unknown };
    trace: ExecutionStep[];
}

function executeGlyphProgram(program: GlyphProgram): ExecutionTrace {
    const glyphs = program.glyphs || {};
    const glyphIds = Object.keys(glyphs).map(Number).sort((a, b) => a - b);
    const values: Map<number, unknown> = new Map();
    const executed: Set<number> = new Set();
    const trace: ExecutionStep[] = [];

    // Topological sort for execution order
    const order = topologicalSort(glyphs, glyphIds);

    // Execute each glyph
    for (const id of order) {
        const glyph = glyphs[id];
        let value: unknown = undefined;
        let didExecute = false;

        try {
            // Check dependencies
            const deps = glyph.dependencies || [];
            const allDepsExecuted = deps.every(dep => executed.has(dep));

            if (allDepsExecuted) {
                value = executeGlyph(id, glyph, values, glyphs);
                didExecute = true;
                executed.add(id);
                if (value !== undefined) {
                    values.set(id, value);
                }
            }
        } catch (e) {
            console.error(`Error executing glyph ${id}:`, e);
        }

        trace.push({
            glyphId: id,
            stratum: glyph.stratum,
            opcode: glyph.opcode,
            executed: didExecute,
            value
        });
    }

    // Find result (last executed glyph's value)
    const lastExecuted = [...executed].pop() || 0;

    return {
        glyphCount: glyphIds.length,
        result: {
            error: 0,
            resultGlyph: lastExecuted,
            resultValue: values.get(lastExecuted)
        },
        trace
    };
}

function topologicalSort(glyphs: Record<string, Glyph>, ids: number[]): number[] {
    const order: number[] = [];
    const remaining = new Set(ids);

    while (remaining.size > 0) {
        let changed = false;

        for (const id of [...remaining]) {
            const glyph = glyphs[id];
            const deps = glyph.dependencies || [];

            if (deps.every(dep => !remaining.has(dep))) {
                order.push(id);
                remaining.delete(id);
                changed = true;
                break;
            }
        }

        if (!changed) {
            // Circular dependency or missing - just add remaining
            for (const id of remaining) {
                order.push(id);
            }
            break;
        }
    }

    return order;
}

function executeGlyph(id: number, glyph: Glyph, values: Map<number, unknown>, glyphs: Record<string, Glyph>): unknown {
    const inv = glyph.invariants || {};
    const deps = glyph.dependencies || [];
    const depValues = deps.map(d => values.get(d));

    switch (glyph.opcode) {
        case 'DATA':
            return inv.value;

        case 'ADD':
            return (depValues[0] as number || 0) + (depValues[1] as number || 0);

        case 'SUB':
            return (depValues[0] as number || 0) - (depValues[1] as number || 0);

        case 'MUL':
            return (depValues[0] as number || 0) * (depValues[1] as number || 0);

        case 'DIV':
            const divisor = depValues[1] as number || 1;
            return divisor !== 0 ? (depValues[0] as number || 0) / divisor : 0;

        case 'MOD':
            const mod = depValues[1] as number || 1;
            return mod !== 0 ? (depValues[0] as number || 0) % mod : 0;

        case 'NEG':
            return -(depValues[0] as number || 0);

        case 'ABS':
            return Math.abs(depValues[0] as number || 0);

        case 'EQ':
            return depValues[0] === depValues[1];

        case 'NE':
            return depValues[0] !== depValues[1];

        case 'LT':
            return (depValues[0] as number || 0) < (depValues[1] as number || 0);

        case 'LE':
            return (depValues[0] as number || 0) <= (depValues[1] as number || 0);

        case 'GT':
            return (depValues[0] as number || 0) > (depValues[1] as number || 0);

        case 'GE':
            return (depValues[0] as number || 0) >= (depValues[1] as number || 0);

        case 'CONCAT':
            return String(depValues[0] || '') + String(depValues[1] || '');

        case 'LEN':
            const str = String(depValues[0] || '');
            return str.length;

        case 'SUBSTR':
            const s = String(depValues[0] || '');
            const start = (depValues[1] as number) || 0;
            const length = (depValues[2] as number) || s.length;
            return s.substring(start, start + length);

        case 'PUSH':
            const arr = [...(depValues[0] as unknown[] || [])];
            arr.push(depValues[1]);
            return arr;

        case 'POP':
            const popArr = [...(depValues[0] as unknown[] || [])];
            return popArr.pop();

        case 'ARRAYLEN':
            return (depValues[0] as unknown[] || []).length;

        case 'GET':
            const getArr = depValues[0] as unknown[] || [];
            const idx = depValues[1] as number || 0;
            return getArr[idx];

        case 'SET':
            const setArr = [...(depValues[0] as unknown[] || [])];
            const setIdx = depValues[1] as number || 0;
            setArr[setIdx] = depValues[2];
            return setArr;

        default:
            return undefined;
    }
}

export function deactivate() {
    if (previewProvider) {
        previewProvider.dispose();
    }
}
