; DESCRIPTION: Draws a purple circle centered at (256, 124) with radius 43.
; PLAN: r0=256(x), r1=124(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 124
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
