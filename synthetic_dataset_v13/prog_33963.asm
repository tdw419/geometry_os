; DESCRIPTION: Composite: Places a blue dot at position (45, 246) then Renders a magenta box of size 64x112 starting at (110, 77).
; PLAN: r0=45(x), r1=246(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=77(y), r7=64(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 246
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 77
LDI r7, 64
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
