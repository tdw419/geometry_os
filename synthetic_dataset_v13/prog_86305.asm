; DESCRIPTION: Draws a purple circle centered at (183, 172) with radius 62.
; PLAN: r0=183(x), r1=172(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 172
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
