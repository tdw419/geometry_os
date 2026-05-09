; DESCRIPTION: Draws a purple circle centered at (183, 191) with radius 37.
; PLAN: r0=183(x), r1=191(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 191
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
