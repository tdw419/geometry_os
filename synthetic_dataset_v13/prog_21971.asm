; DESCRIPTION: Renders a magenta box of size 20x114 starting at (110, 37).
; PLAN: r0=110(x), r1=37(y), r2=20(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 37
LDI r2, 20
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
