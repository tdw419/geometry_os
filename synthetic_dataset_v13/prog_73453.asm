; DESCRIPTION: Draws a purple circle centered at (183, 49) with radius 30.
; PLAN: r0=183(x), r1=49(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 49
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
