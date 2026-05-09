; DESCRIPTION: Draws a purple circle centered at (142, 45) with radius 35.
; PLAN: r0=142(x), r1=45(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 45
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
