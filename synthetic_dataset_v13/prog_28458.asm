; DESCRIPTION: Draws a purple circle centered at (53, 54) with radius 11.
; PLAN: r0=53(x), r1=54(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 54
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
