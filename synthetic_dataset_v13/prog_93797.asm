; DESCRIPTION: Draws a purple circle centered at (424, 136) with radius 57.
; PLAN: r0=424(x), r1=136(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 136
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
