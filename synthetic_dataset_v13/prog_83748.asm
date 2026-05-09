; DESCRIPTION: Draws a purple circle centered at (432, 71) with radius 66.
; PLAN: r0=432(x), r1=71(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 71
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
