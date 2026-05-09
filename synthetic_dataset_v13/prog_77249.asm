; DESCRIPTION: Draws a blue circle centered at (118, 109) with radius 63.
; PLAN: r0=118(x), r1=109(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 109
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
