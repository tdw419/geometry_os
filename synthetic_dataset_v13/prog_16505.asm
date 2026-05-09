; DESCRIPTION: Draws a purple circle centered at (288, 131) with radius 35.
; PLAN: r0=288(x), r1=131(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 131
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
