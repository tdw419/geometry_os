; DESCRIPTION: Draws a purple circle centered at (304, 108) with radius 76.
; PLAN: r0=304(x), r1=108(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 108
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
