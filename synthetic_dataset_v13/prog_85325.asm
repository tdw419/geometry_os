; DESCRIPTION: Draws a purple circle centered at (213, 188) with radius 62.
; PLAN: r0=213(x), r1=188(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 188
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
