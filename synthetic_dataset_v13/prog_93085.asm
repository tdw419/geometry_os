; DESCRIPTION: Draws a purple circle centered at (200, 204) with radius 40.
; PLAN: r0=200(x), r1=204(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 204
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
