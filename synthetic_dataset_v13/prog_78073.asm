; DESCRIPTION: Draws a purple circle centered at (24, 118) with radius 12.
; PLAN: r0=24(x), r1=118(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 118
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
