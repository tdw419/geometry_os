; DESCRIPTION: Draws a purple circle centered at (459, 167) with radius 28.
; PLAN: r0=459(x), r1=167(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 167
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
