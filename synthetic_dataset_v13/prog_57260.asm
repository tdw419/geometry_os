; DESCRIPTION: Draws a purple circle centered at (76, 122) with radius 51.
; PLAN: r0=76(x), r1=122(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 122
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
