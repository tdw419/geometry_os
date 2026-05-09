; DESCRIPTION: Renders a magenta box of size 20x75 starting at (263, 111).
; PLAN: r0=263(x), r1=111(y), r2=20(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 111
LDI r2, 20
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
