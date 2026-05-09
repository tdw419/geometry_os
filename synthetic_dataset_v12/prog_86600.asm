; DESCRIPTION: Draws a purple circle centered at (71, 62) with radius 17.
; PLAN: r0=71(x), r1=62(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 62
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
