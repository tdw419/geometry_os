; DESCRIPTION: Draws a purple circle centered at (432, 118) with radius 18.
; PLAN: r0=432(x), r1=118(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 118
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
