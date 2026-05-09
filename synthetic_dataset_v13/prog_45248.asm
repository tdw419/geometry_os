; DESCRIPTION: Draws a blue circle centered at (118, 105) with radius 79.
; PLAN: r0=118(x), r1=105(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 105
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
