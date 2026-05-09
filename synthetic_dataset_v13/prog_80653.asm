; DESCRIPTION: Draws a purple circle centered at (56, 40) with radius 11.
; PLAN: r0=56(x), r1=40(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 40
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
