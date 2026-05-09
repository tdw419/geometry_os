; DESCRIPTION: Renders a magenta box of size 15x105 starting at (285, 110).
; PLAN: r0=285(x), r1=110(y), r2=15(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 110
LDI r2, 15
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
