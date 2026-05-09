; DESCRIPTION: Draws a purple circle centered at (358, 81) with radius 68.
; PLAN: r0=358(x), r1=81(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 81
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
