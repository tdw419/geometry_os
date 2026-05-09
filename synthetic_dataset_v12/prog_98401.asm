; DESCRIPTION: Draws a purple circle centered at (72, 192) with radius 46.
; PLAN: r0=72(x), r1=192(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 192
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
