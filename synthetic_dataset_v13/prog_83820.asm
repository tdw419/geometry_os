; DESCRIPTION: Draws a purple circle centered at (358, 58) with radius 14.
; PLAN: r0=358(x), r1=58(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 58
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
