; DESCRIPTION: Draws a purple circle centered at (327, 124) with radius 76.
; PLAN: r0=327(x), r1=124(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 124
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
