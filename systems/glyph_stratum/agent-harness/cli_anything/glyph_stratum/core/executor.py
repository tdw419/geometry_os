"""
GlyphStratum Executor - runs GlyphStratum programs.

Maps glyphs to Python operations for execution.
This bridges the visual representation to actual computation.
"""
from typing import Any, Dict, List, Optional, Callable
from dataclasses import dataclass, field
import json

from .stratum import GlyphInfo, Stratum, Opcode, GlyphMetadata
from .glyph_registry import GlyphRegistry


@dataclass
class ExecutionFrame:
    """A stack frame during execution."""
    name: str
    glyph_index: int
    locals: Dict[str, Any] = field(default_factory=dict)
    parent: Optional["ExecutionFrame"] = None


@dataclass
class ExecutionState:
    """Full execution state."""
    frames: List[ExecutionFrame] = field(default_factory=list)
    memory: Dict[int, Any] = field(default_factory=dict)  # address -> value
    next_address: int = 0
    output: List[Any] = field(default_factory=list)
    halted: bool = False
    error: Optional[str] = None

    def push_frame(self, name: str, glyph_index: int) -> ExecutionFrame:
        parent = self.frames[-1] if self.frames else None
        frame = ExecutionFrame(name=name, glyph_index=glyph_index, parent=parent)
        self.frames.append(frame)
        return frame

    def pop_frame(self) -> Optional[ExecutionFrame]:
        return self.frames.pop() if self.frames else None

    @property
    def current_frame(self) -> Optional[ExecutionFrame]:
        return self.frames[-1] if self.frames else None


class GlyphStratumExecutor:
    """Executes GlyphStratum programs."""

    def __init__(self, registry: GlyphRegistry):
        self.registry = registry
        self.state = ExecutionState()
        self.builtins: Dict[str, Callable] = {}
        self._setup_builtins()

    def _setup_builtins(self):
        """Register builtin operations."""
        # Arithmetic
        self.builtins["+"] = lambda *args: sum(args)
        self.builtins["-"] = lambda a, b=None: -a if b is None else a - b
        self.builtins["*"] = lambda *args: eval("*".join(str(a) for a in args)) if args else 1
        self.builtins["/"] = lambda a, b: a / b
        self.builtins["mod"] = lambda a, b: a % b

        # Comparison
        self.builtins["="] = lambda a, b: a == b
        self.builtins["<"] = lambda a, b: a < b
        self.builtins[">"] = lambda a, b: a > b

        # List
        self.builtins["cons"] = lambda a, b: [a] + (b if isinstance(b, list) else [b])
        self.builtins["car"] = lambda x: x[0] if x else None
        self.builtins["cdr"] = lambda x: x[1:] if len(x) > 1 else []
        self.builtins["list"] = lambda *args: list(args)
        self.builtins["null?"] = lambda x: x == [] or x is None

        # I/O
        self.builtins["print"] = lambda x: self.state.output.append(x)

    def allocate(self, value: Any = None) -> int:
        """Allocate memory and return address."""
        addr = self.state.next_address
        self.state.next_address += 1
        self.state.memory[addr] = value
        return addr

    def free(self, addr: int) -> bool:
        """Free memory at address."""
        if addr in self.state.memory:
            del self.state.memory[addr]
            return True
        return False

    def load(self, addr: int) -> Any:
        """Load value from memory."""
        return self.state.memory.get(addr)

    def store(self, addr: int, value: Any) -> bool:
        """Store value at address."""
        if addr in self.state.memory:
            self.state.memory[addr] = value
            return True
        return False

    def execute_glyph(self, glyph: GlyphInfo, args: List[Any] = None) -> Any:
        """Execute a single glyph."""
        if self.state.halted:
            return None

        args = args or []

        try:
            if glyph.opcode == Opcode.NOP:
                return None

            elif glyph.opcode == Opcode.ALLOC:
                value = args[0] if args else None
                addr = self.allocate(value)
                return addr

            elif glyph.opcode == Opcode.FREE:
                addr = args[0] if args else None
                return self.free(addr) if addr is not None else False

            elif glyph.opcode == Opcode.LOAD:
                addr = args[0] if args else None
                return self.load(addr) if addr is not None else None

            elif glyph.opcode == Opcode.STORE:
                if len(args) >= 2:
                    return self.store(args[0], args[1])
                return False

            elif glyph.opcode == Opcode.LOOP:
                # Execute body while condition
                # args: [condition_fn, body_fn, initial_state]
                if len(args) >= 3:
                    condition, body, state = args[0], args[1], args[2]
                    iterations = 0
                    max_iterations = 10000
                    while condition(state) and iterations < max_iterations:
                        state = body(state)
                        iterations += 1
                    return state
                return None

            elif glyph.opcode == Opcode.BRANCH:
                # args: [condition, then_fn, else_fn]
                if len(args) >= 2:
                    condition = args[0]
                    if condition:
                        return args[1]() if callable(args[1]) else args[1]
                    elif len(args) >= 3:
                        return args[2]() if callable(args[2]) else args[2]
                return None

            elif glyph.opcode == Opcode.CALL:
                # Call a function by name or glyph index
                if args:
                    fn = args[0]
                    fn_args = args[1:] if len(args) > 1 else []
                    if isinstance(fn, str) and fn in self.builtins:
                        return self.builtins[fn](*fn_args)
                    elif callable(fn):
                        return fn(*fn_args)
                return None

            elif glyph.opcode == Opcode.RETURN:
                # Return value from current frame
                value = args[0] if args else None
                return value

            elif glyph.opcode == Opcode.DATA:
                # Return literal data
                if args:
                    return args[0]
                # Check invariants for stored data
                if "value" in glyph.metadata.invariants:
                    return glyph.metadata.invariants["value"]
                return None

            elif glyph.opcode == Opcode.TYPE:
                # Type declaration - returns type info
                return {"type": "declaration", "name": glyph.metadata.rationale}

            elif glyph.opcode == Opcode.MODULE:
                # Module - execute all dependencies in order
                results = {}
                for dep_idx in glyph.metadata.dependencies:
                    dep = self.registry.get(dep_idx)
                    if dep:
                        results[dep_idx] = self.execute_glyph(dep, [])
                return results

            elif glyph.opcode == Opcode.HALT:
                self.state.halted = True
                self.state.error = glyph.metadata.rationale or "Program halted"
                return None

            else:
                return None

        except Exception as e:
            self.state.error = str(e)
            return None

    def run(self, entry_point: Optional[int] = None) -> Any:
        """Run the entire program from entry point."""
        self.state = ExecutionState()

        # Find entry point (INTENT stratum MODULE, or first glyph)
        if entry_point is None:
            intent_glyphs = self.registry.by_stratum(Stratum.INTENT)
            if intent_glyphs:
                entry_point = intent_glyphs[0][0]
            elif self.registry.glyphs:
                entry_point = min(self.registry.glyphs.keys())

        if entry_point is None:
            return None

        entry_glyph = self.registry.get(entry_point)
        if not entry_glyph:
            return None

        # Push initial frame
        self.state.push_frame("main", entry_point)

        # Execute
        result = self.execute_glyph(entry_glyph)

        return result

    def run_interactive(self, commands: List[Dict]) -> List[Any]:
        """Run a sequence of commands interactively."""
        results = []
        for cmd in commands:
            opcode_name = cmd.get("opcode")
            args = cmd.get("args", [])

            try:
                opcode = Opcode[opcode_name.upper()]
            except KeyError:
                results.append({"error": f"Unknown opcode: {opcode_name}"})
                continue

            # Create temporary glyph for execution
            temp_glyph = GlyphInfo(
                index=-1,
                stratum=Stratum.LOGIC,
                opcode=opcode,
                metadata=type('obj', (object,), {'dependencies': [], 'invariants': {}, 'rationale': ''})()
            )

            result = self.execute_glyph(temp_glyph, args)
            results.append({"result": result, "opcode": opcode_name})

        return results

    def status(self) -> Dict:
        """Get execution status."""
        return {
            "halted": self.state.halted,
            "error": self.state.error,
            "frame_depth": len(self.state.frames),
            "memory_allocated": len(self.state.memory),
            "output": self.state.output,
        }


def run_program(registry: GlyphRegistry, entry: Optional[int] = None) -> Dict:
    """Convenience function to run a program."""
    executor = GlyphStratumExecutor(registry)
    result = executor.run(entry)
    return {
        "result": result,
        "status": executor.status(),
    }
