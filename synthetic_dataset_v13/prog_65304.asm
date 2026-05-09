; DESCRIPTION: Draws a purple circle centered at (402, 151) with radius 74.
; PLAN: r0=402(x), r1=151(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 151
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
