; DESCRIPTION: Draws a blue circle centered at (118, 51) with radius 30.
; PLAN: r0=118(x), r1=51(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 51
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
