; DESCRIPTION: Draws a purple circle centered at (204, 115) with radius 80.
; PLAN: r0=204(x), r1=115(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 115
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
