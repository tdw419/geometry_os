; DESCRIPTION: Draws a purple circle centered at (361, 167) with radius 75.
; PLAN: r0=361(x), r1=167(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 167
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
