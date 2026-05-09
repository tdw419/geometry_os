; DESCRIPTION: Draws a purple circle centered at (230, 97) with radius 62.
; PLAN: r0=230(x), r1=97(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 97
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
