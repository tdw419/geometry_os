; DESCRIPTION: Draws a purple circle centered at (11, 39) with radius 11.
; PLAN: r0=11(x), r1=39(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 11
LDI r1, 39
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
