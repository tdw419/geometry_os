; DESCRIPTION: Draws a purple circle centered at (122, 147) with radius 71.
; PLAN: r0=122(x), r1=147(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 147
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
