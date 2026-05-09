; DESCRIPTION: Draws a purple circle centered at (221, 124) with radius 19.
; PLAN: r0=221(x), r1=124(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 124
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
