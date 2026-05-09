; DESCRIPTION: Composite: Places a magenta dot at position (21, 20) then Renders a magenta box of size 63x85 starting at (320, 56).
; PLAN: r0=21(x), r1=20(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=56(y), r7=63(width), r8=85(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 20
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 56
LDI r7, 63
LDI r8, 85
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
