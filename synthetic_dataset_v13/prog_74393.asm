; DESCRIPTION: Draws a purple circle centered at (372, 188) with radius 33.
; PLAN: r0=372(x), r1=188(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 188
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
