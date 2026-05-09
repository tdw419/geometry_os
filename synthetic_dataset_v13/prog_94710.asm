; DESCRIPTION: Composite: Places a magenta dot at position (154, 173) then Renders a magenta box of size 82x36 starting at (275, 23).
; PLAN: r0=154(x), r1=173(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=23(y), r7=82(width), r8=36(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 173
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 275
LDI r6, 23
LDI r7, 82
LDI r8, 36
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
