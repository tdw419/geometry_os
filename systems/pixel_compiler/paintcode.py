"""
PaintCode: Visual IDE for PixelRTS
Features:
- Real-time pixel painting from assembly
- Hilbert curve continuity checking
- Register color allocation
- Execution heatmaps
- GPU debugging integration
"""
import tkinter as tk
from tkinter import ttk, scrolledtext
from PIL import Image, ImageTk
import numpy as np
from vasm import VisualAssembler

# Try to import GPU debugging components
try:
    from gpu_executor import GPUExecutor
    from trace_viewer import TraceVisualizer
    GPU_AVAILABLE = True
except ImportError:
    GPU_AVAILABLE = False

class PaintCodeIDE:
    def __init__(self, root):
        self.root = root
        self.root.title("PaintCode - PixelRTS Visual IDE")
        self.root.geometry("1400x900")

        # Initialize assembler
        self.assembler = VisualAssembler()

        # Create layout
        self.create_layout()

        # Bind events
        self.bind_events()

    def create_layout(self):
        """Create main IDE layout"""
        # Main container
        main_frame = ttk.Frame(self.root, padding="5")
        main_frame.pack(fill=tk.BOTH, expand=True)

        # Left panel: Code editor
        left_panel = ttk.Frame(main_frame)
        left_panel.pack(side=tk.LEFT, fill=tk.BOTH, expand=True, padx=(0, 5))

        ttk.Label(left_panel, text="Assembly Source", font=('Arial', 10, 'bold')).pack(anchor=tk.W)
        self.code_editor = scrolledtext.ScrolledText(
            left_panel,
            width=60,
            height=40,
            font=('Courier', 11),
            bg='#1e1e1e',
            fg='#d4d4d4',
            insertbackground='white'
        )
        self.code_editor.pack(fill=tk.BOTH, expand=True)

        # Right panel: Visual preview
        right_panel = ttk.Frame(main_frame)
        right_panel.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True)

        ttk.Label(right_panel, text="Visual Preview", font=('Arial', 10, 'bold')).pack(anchor=tk.W)

        # Canvas for image
        self.canvas_frame = ttk.Frame(right_panel)
        self.canvas_frame.pack(fill=tk.BOTH, expand=True)
        self.canvas = tk.Canvas(self.canvas_frame, bg='#000000')
        self.canvas.pack(fill=tk.BOTH, expand=True)

        # Status bar
        self.status_bar = ttk.Label(
            right_panel,
            text="Ready | Instructions: 0 | Size: 0x0",
            relief=tk.SUNKEN
        )
        self.status_bar.pack(fill=tk.X, pady=(5, 0))

        # Toolbar
        toolbar = ttk.Frame(left_panel)
        toolbar.pack(fill=tk.X, pady=(0, 5))

        ttk.Button(toolbar, text="Compile", command=self.compile).pack(side=tk.LEFT, padx=2)
        ttk.Button(toolbar, text="Save .rts.png", command=self.save_png).pack(side=tk.LEFT, padx=2)
        ttk.Button(toolbar, text="Load .rts.png", command=self.load_png).pack(side=tk.LEFT, padx=2)
        ttk.Button(toolbar, text="Export Assembly", command=self.export_asm).pack(side=tk.LEFT, padx=2)

        # Mode selector
        ttk.Label(toolbar, text="Mode:").pack(side=tk.LEFT, padx=(10, 2))
        self.mode_var = tk.StringVar(value='code')
        ttk.Combobox(toolbar, textvariable=self.mode_var,
                    values=['standard', 'code'], width=10, state='readonly').pack(side=tk.LEFT)

        # Debug controls (if GPU available)
        if GPU_AVAILABLE:
            ttk.Frame(toolbar, width=20).pack(side=tk.LEFT)  # Spacer
            ttk.Label(toolbar, text="Debug:", font=('Arial', 9, 'bold')).pack(side=tk.LEFT, padx=(5, 2))

            self.run_button = ttk.Button(toolbar, text="▶ Run", command=self.run_debug, width=6)
            self.run_button.pack(side=tk.LEFT, padx=2)

            self.step_button = ttk.Button(toolbar, text="Step", command=self.step_debug, state=tk.DISABLED, width=6)
            self.step_button.pack(side=tk.LEFT, padx=2)

            self.trace_button = ttk.Button(toolbar, text="Trace", command=self.show_trace, state=tk.DISABLED, width=8)
            self.trace_button.pack(side=tk.LEFT, padx=2)

            self.heatmap_button = ttk.Button(toolbar, text="Heatmap", command=self.show_heatmap, state=tk.DISABLED, width=8)
            self.heatmap_button.pack(side=tk.LEFT, padx=2)

        # Initialize debug state
        self.debug_result = None
        self.debug_step = 0
        self.debug_highlight_id = None

    def bind_events(self):
        """Bind event handlers"""
        self.code_editor.bind('<KeyRelease>', self.on_code_change)
        self.code_editor.bind('<Tab>', self.handle_tab)
        self.canvas.bind('<Button-1>', self.on_canvas_click)

    def compile(self):
        """Compile assembly to pixels"""
        source = self.code_editor.get("1.0", tk.END)

        try:
            # Reset assembler
            self.assembler = VisualAssembler()
            self.assembler.compile(source)

            # Generate pixels
            mode = self.mode_var.get()
            pixels = self.assembler.encode_to_pixels(mode)

            # Display on canvas
            self.display_pixels(pixels)

            # Update status
            height, width = pixels.shape[:2]
            self.status_bar.config(
                text=f"Compiled | Instructions: {len(self.assembler.instructions)} | Size: {width}x{height}"
            )

        except Exception as e:
            self.status_bar.config(text=f"Error: {str(e)}")
            self.show_error(str(e))

    def display_pixels(self, pixels: np.ndarray):
        """Display pixel array on canvas"""
        from PIL import Image

        img = Image.fromarray(pixels, 'RGBA')

        # Resize for display (maintain aspect ratio)
        canvas_width = self.canvas.winfo_width()
        if canvas_width < 100:
            canvas_width = 600

        scale = canvas_width / pixels.shape[1]
        if scale > 4:
            scale = 4  # Max 4x zoom

        new_size = (int(pixels.shape[1] * scale), int(pixels.shape[0] * scale))
        img_resized = img.resize(new_size, Image.NEAREST)

        self.photo = ImageTk.PhotoImage(img_resized)
        self.canvas.delete("all")
        self.canvas.create_image(0, 0, anchor=tk.NW, image=self.photo)

        # Draw grid if zoomed in
        if scale >= 2:
            self.draw_grid(new_size, scale)

    def draw_grid(self, size, scale):
        """Draw pixel grid overlay"""
        width, height = size
        for x in range(0, width, int(scale)):
            self.canvas.create_line(x, 0, x, height, fill='#333333', width=1)
        for y in range(0, height, int(scale)):
            self.canvas.create_line(0, y, width, y, fill='#333333', width=1)

    def on_code_change(self, event=None):
        """Auto-compile on code change with debouncing"""
        if hasattr(self, '_compile_timer'):
            self.root.after_cancel(self._compile_timer)
        self._compile_timer = self.root.after(500, self.compile)

    def handle_tab(self, event):
        """Insert 4 spaces on Tab"""
        self.code_editor.insert(tk.INSERT, "    ")
        return "break"

    def on_canvas_click(self, event):
        """Handle canvas click to inspect pixel"""
        x = self.canvas.canvasx(event.x)
        y = self.canvas.canvasy(event.y)

        # Convert to pixel coordinates
        # (Implementation depends on current zoom level)
        self.status_bar.config(text=f"Clicked at ({int(x)}, {int(y)})")

    def save_png(self):
        """Save compiled program as PNG"""
        from tkinter import filedialog

        if not self.assembler.instructions:
            self.show_error("No compiled program to save")
            return

        filename = filedialog.asksaveasfilename(
            defaultextension=".rts.png",
            filetypes=[("PixelRTS Program", "*.rts.png"), ("PNG", "*.png")]
        )

        if filename:
            try:
                mode = self.mode_var.get()
                self.assembler.save_png(filename, mode)
                self.status_bar.config(text=f"Saved to {filename}")
            except Exception as e:
                self.show_error(f"Save failed: {e}")

    def load_png(self):
        """Load PNG and disassemble"""
        from tkinter import filedialog
        from vdisasm import VisualDisassembler

        filename = filedialog.askopenfilename(
            filetypes=[("PixelRTS Program", "*.rts.png"), ("PNG", "*.png")]
        )

        if filename:
            try:
                disasm = VisualDisassembler()
                source = disasm.disassemble_file(filename)
                self.code_editor.delete("1.0", tk.END)
                self.code_editor.insert("1.0", source)
                self.compile()
            except Exception as e:
                self.show_error(f"Load failed: {e}")

    def export_asm(self):
        """Export assembly source"""
        from tkinter import filedialog

        filename = filedialog.asksaveasfilename(
            defaultextension=".vasm",
            filetypes=[("Assembly", "*.vasm"), ("Text", "*.txt")]
        )

        if filename:
            with open(filename, 'w') as f:
                f.write(self.code_editor.get("1.0", tk.END))
            self.status_bar.config(text=f"Exported to {filename}")

    def show_error(self, message):
        """Show error message"""
        error_win = tk.Toplevel(self.root)
        error_win.title("Error")
        ttk.Label(error_win, text=message, padding=20).pack()
        ttk.Button(error_win, text="OK", command=error_win.destroy).pack(pady=5)

    # ========== GPU Debug Methods ==========

    def run_debug(self):
        """Execute program on GPU and show results"""
        if not GPU_AVAILABLE:
            self.show_error("GPU execution not available.\nInstall wgpu: pip install wgpu")
            return

        try:
            # Compile if needed
            if not self.assembler.instructions:
                self.compile()

            # Get pixels
            mode = self.mode_var.get()
            pixels = self.assembler.encode_to_pixels(mode)

            # Execute on GPU
            executor = GPUExecutor()
            executor.load_program(pixels)
            result = executor.run()

            # Update status
            self.status_bar.config(
                text=f"Executed {result.steps} instructions | R0={result.registers[0]:.1f} | R1={result.registers[1]:.1f}"
            )

            # Store result for stepping
            self.debug_result = result
            self.debug_step = 0

            # Enable debug controls
            self.step_button.config(state=tk.NORMAL)
            self.trace_button.config(state=tk.NORMAL)
            self.heatmap_button.config(state=tk.NORMAL)

            # Highlight first instruction
            if result.trace:
                self.highlight_instruction(result.trace[0]['pc'])

        except Exception as e:
            import traceback
            traceback.print_exc()
            self.show_error(f"Debug failed: {e}")

    def step_debug(self):
        """Step through execution trace"""
        if not hasattr(self, 'debug_result') or not self.debug_result:
            return

        trace = self.debug_result.trace
        if self.debug_step >= len(trace):
            self.status_bar.config(text="End of trace reached")
            return

        entry = trace[self.debug_step]
        self.highlight_instruction(entry['pc'])

        # Get opcode name
        opcodes = {
            0: 'NOP', 1: 'LOAD', 2: 'MOV', 10: 'LOAD', 11: 'MOV',
            100: 'ADD', 101: 'SUB', 102: 'MUL', 103: 'DIV',
            200: 'JMP', 201: 'JZ', 202: 'JNZ',
            210: 'CALL', 211: 'RET',
            40: 'TEXTURE', 41: 'SAMPLE',
        }
        op_name = opcodes.get(entry['opcode'], f'OP{entry["opcode"]}')

        self.status_bar.config(
            text=f"Step {self.debug_step + 1}/{len(trace)}: "
                 f"PC={entry['pc']} {op_name} | R0={self.debug_result.registers[0]:.1f}"
        )
        self.debug_step += 1

    def show_trace(self):
        """Show trace visualization in new window"""
        if not hasattr(self, 'debug_result') or not self.debug_result.trace:
            self.show_error("No trace data available. Run debug first.")
            return

        try:
            from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
            from matplotlib.backends.backend_tkagg import NavigationToolbar2Tk
            import matplotlib.pyplot as plt

            # Create trace viewer
            viz = TraceVisualizer()

            # Convert trace from dict to TraceEntry
            from trace_viewer import TraceEntry
            trace_entries = []
            for entry in self.debug_result.trace:
                trace_entries.append(TraceEntry(
                    pc=entry['pc'],
                    opcode=entry['opcode'],
                    dest=entry.get('dest', 0),
                    src=entry.get('src', 0),
                    immediate=entry.get('immediate', 0)
                ))

            # Get program shape
            mode = self.mode_var.get()
            pixels = self.assembler.encode_to_pixels(mode)

            # Create figure with timeline and heatmap side by side
            fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 6))

            # Timeline: PC over time
            pcs = [entry['pc'] for entry in self.debug_result.trace]
            ax1.plot(pcs, drawstyle='steps-post', linewidth=1.5)
            ax1.set_title('Program Counter Over Time')
            ax1.set_xlabel('Step')
            ax1.set_ylabel('PC')
            ax1.grid(True, alpha=0.3)
            ax1.axhline(y=len(pixels) * pixels.shape[1], color='r', linestyle='--', alpha=0.5, label='Program End')
            ax1.legend()

            # Heatmap
            heatmap = viz.render_heatmap(trace_entries, pixels.shape[:2])
            im = ax2.imshow(heatmap, cmap='hot', interpolation='nearest')
            ax2.set_title('Execution Heatmap')
            ax2.set_xlabel('X (Pixel Column)')
            ax2.set_ylabel('Y (Pixel Row)')
            plt.colorbar(im, ax=ax2, label='Execution Count')

            plt.tight_layout()

            # Show in new window
            trace_win = tk.Toplevel(self.root)
            trace_win.title(f"Execution Trace - {len(trace_entries)} instructions")
            trace_win.geometry("1000x600")

            canvas = FigureCanvasTkAgg(fig, master=trace_win)
            canvas.draw()
            canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)

            toolbar = NavigationToolbar2Tk(canvas, trace_win)
            toolbar.update()
            canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)

        except Exception as e:
            import traceback
            traceback.print_exc()
            self.show_error(f"Failed to show trace: {e}")

    def show_heatmap(self):
        """Generate and save heatmap image"""
        if not hasattr(self, 'debug_result') or not self.debug_result.trace:
            self.show_error("No trace data available. Run debug first.")
            return

        from tkinter import filedialog

        filename = filedialog.asksaveasfilename(
            defaultextension="_heatmap.png",
            filetypes=[("PNG", "*.png"), ("PDF", "*.pdf")]
        )

        if filename:
            try:
                viz = TraceVisualizer()
                from trace_viewer import TraceEntry

                trace_entries = []
                for entry in self.debug_result.trace:
                    trace_entries.append(TraceEntry(
                        pc=entry['pc'],
                        opcode=entry['opcode'],
                        dest=entry.get('dest', 0),
                        src=entry.get('src', 0),
                        immediate=entry.get('immediate', 0)
                    ))

                mode = self.mode_var.get()
                pixels = self.assembler.encode_to_pixels(mode)

                fig = viz.plot_heatmap(trace_entries, pixels.shape[:2])
                fig.savefig(filename, dpi=150, bbox_inches='tight')
                self.status_bar.config(text=f"Heatmap saved to {filename}")
            except Exception as e:
                self.show_error(f"Failed to save heatmap: {e}")

    def highlight_instruction(self, pc: int):
        """Highlight instruction at program counter"""
        # Clear previous highlight
        if self.debug_highlight_id:
            self.canvas.delete(self.debug_highlight_id)

        # Get current pixels
        mode = self.mode_var.get()
        pixels = self.assembler.encode_to_pixels(mode)

        h, w = pixels.shape[:2]
        y = pc // w
        x = pc % w

        # Redraw to clear previous state
        self.display_pixels(pixels)

        # Calculate highlight position
        canvas_width = self.canvas.winfo_width()
        if canvas_width < 100:
            canvas_width = 600

        scale = canvas_width / w
        if scale > 4:
            scale = 4

        x1 = x * scale
        y1 = y * scale
        x2 = x1 + scale
        y2 = y1 + scale

        # Draw yellow highlight rectangle
        self.debug_highlight_id = self.canvas.create_rectangle(
            x1, y1, x2, y2,
            outline='yellow',
            width=3,
            tags='highlight'
        )
        self.canvas.tag_raise('highlight')

def main():
    root = tk.Tk()
    app = PaintCodeIDE(root)

    # Load example program
    example = """; Example: Fibonacci sequence
LOAD R0, 10      ; Counter
LOAD R1, 0       ; Fib(n-2)
LOAD R2, 1       ; Fib(n-1)
LOAD R3, 0       ; Current

loop:
ADD R3, R1       ; Current = Fib(n-2) + Fib(n-1)
ADD R3, R2

MOV R1, R2       ; Shift: Fib(n-2) = Fib(n-1)
MOV R2, R3       ; Shift: Fib(n-1) = Current

SUB R0, 1        ; Decrement counter
JNZ R0, loop     ; Continue if not zero

RET R3           ; Return result
"""
    app.code_editor.insert("1.0", example)
    app.compile()

    root.mainloop()

if __name__ == "__main__":
    main()
