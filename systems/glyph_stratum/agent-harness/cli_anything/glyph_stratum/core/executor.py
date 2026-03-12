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
        """Execute a single glyph, resolving dependencies first."""
        if self.state.halted:
            return None

        # If no explicit args, resolve dependencies
        if args is None:
            args = self._resolve_dependencies(glyph)

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
                return self._execute_loop(glyph, args)

            elif glyph.opcode == Opcode.BRANCH:
                return self._execute_branch(glyph, args)

            elif glyph.opcode == Opcode.CALL:
                return self._execute_call(glyph, args)

            elif glyph.opcode == Opcode.RETURN:
                value = args[0] if args else None
                return value

            elif glyph.opcode == Opcode.DATA:
                # Return literal data from invariants or args
                if "value" in glyph.metadata.invariants:
                    return glyph.metadata.invariants["value"]
                if args:
                    return args[0]
                return None

            elif glyph.opcode == Opcode.TYPE:
                return {"type": "declaration", "name": glyph.metadata.rationale}

            elif glyph.opcode == Opcode.STRUCT:
                return self._execute_struct(glyph, args)

            elif glyph.opcode == Opcode.PTR:
                # Pointer - return reference to value
                if args:
                    return ("ptr", args[0])
                return None

            elif glyph.opcode == Opcode.MODULE:
                return self._execute_module(glyph)

            elif glyph.opcode == Opcode.EXPORT:
                # Export - just return the value
                return args[0] if args else None

            elif glyph.opcode == Opcode.IMPORT:
                # Import - resolve by name from rationale
                name = glyph.metadata.rationale
                if name in self.builtins:
                    return self.builtins[name]
                return None

            elif glyph.opcode == Opcode.HALT:
                self.state.halted = True
                self.state.error = glyph.metadata.rationale or "Program halted"
                return None

            else:
                return None

        except Exception as e:
            self.state.error = str(e)
            return None

    def _resolve_dependencies(self, glyph: GlyphInfo) -> List[Any]:
        """Execute all dependencies and return their results as args."""
        results = []
        for dep_idx in glyph.metadata.dependencies:
            dep = self.registry.get(dep_idx)
            if dep:
                result = self.execute_glyph(dep)
                results.append(result)
        return results

    def _execute_loop(self, glyph: GlyphInfo, args: List[Any]) -> Any:
        """Execute a loop: dependencies are [init, condition, body]."""
        deps = glyph.metadata.dependencies
        if len(deps) < 3:
            return None

        # Get glyphs
        init_glyph = self.registry.get(deps[0])
        cond_glyph = self.registry.get(deps[1])
        body_glyph = self.registry.get(deps[2])

        if not all([init_glyph, cond_glyph, body_glyph]):
            return None

        # Execute init
        state = self.execute_glyph(init_glyph)

        iterations = 0
        max_iterations = 10000

        while iterations < max_iterations:
            # Check condition with current state
            cond_result = self.execute_glyph(cond_glyph, [state])
            if not cond_result:
                break

            # Execute body with state
            state = self.execute_glyph(body_glyph, [state])
            iterations += 1

        return state

    def _execute_branch(self, glyph: GlyphInfo, args: List[Any]) -> Any:
        """Execute a branch: deps are [condition, then, else?]."""
        deps = glyph.metadata.dependencies
        if len(deps) < 2:
            return None

        cond_glyph = self.registry.get(deps[0])
        then_glyph = self.registry.get(deps[1])
        else_glyph = self.registry.get(deps[2]) if len(deps) > 2 else None

        if not cond_glyph or not then_glyph:
            return None

        # Execute condition
        cond_result = self.execute_glyph(cond_glyph)

        if cond_result:
            return self.execute_glyph(then_glyph)
        elif else_glyph:
            return self.execute_glyph(else_glyph)

        return None

    def _execute_call(self, glyph: GlyphInfo, args: List[Any]) -> Any:
        """Execute a function call."""
        # Rationale contains function name or expression
        fn_name = glyph.metadata.rationale.strip()

        # Check builtins first
        if fn_name in self.builtins:
            return self.builtins[fn_name](*args)

        # Try to evaluate as expression
        try:
            # Safe eval with only builtins and args
            safe_dict = {"args": args}
            safe_dict.update(self.builtins)

            # Handle simple arithmetic
            if all(c in "0123456789+-*/(). " for c in fn_name):
                return eval(fn_name, {"__builtins__": {}}, safe_dict)

            # Handle function call syntax: fn(arg1, arg2)
            if "(" in fn_name:
                # Parse function name
                parts = fn_name.split("(")
                func = parts[0].strip()
                if func in self.builtins:
                    return self.builtins[func](*args)

        except Exception:
            pass

        # If args are provided, try using first arg as function
        if args and callable(args[0]):
            return args[0](*args[1:])

        return None

    def _execute_struct(self, glyph: GlyphInfo, args: List[Any]) -> Any:
        """Execute a struct - create a dict from fields."""
        fields = glyph.metadata.invariants.get("fields", [])
        if isinstance(fields, list) and args:
            return dict(zip(fields, args))
        return {"_struct": glyph.metadata.rationale, "values": args}

    def _execute_module(self, glyph: GlyphInfo) -> Any:
        """Execute a module - run all dependencies in order."""
        results = {}
        for dep_idx in glyph.metadata.dependencies:
            dep = self.registry.get(dep_idx)
            if dep:
                results[dep_idx] = self.execute_glyph(dep)
        return results

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
