; DESCRIPTION: Renders a magenta box of size 20x37 starting at (141, 175).
; PLAN: r0=141(x), r1=175(y), r2=20(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 175
LDI r2, 20
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
