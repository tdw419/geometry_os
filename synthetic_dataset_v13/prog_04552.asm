; DESCRIPTION: Renders a magenta box of size 20x44 starting at (311, 13).
; PLAN: r0=311(x), r1=13(y), r2=20(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 13
LDI r2, 20
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
