; DESCRIPTION: Draws a purple circle centered at (222, 176) with radius 63.
; PLAN: r0=222(x), r1=176(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 176
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
