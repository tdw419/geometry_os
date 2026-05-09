; DESCRIPTION: Draws a purple circle centered at (163, 109) with radius 40.
; PLAN: r0=163(x), r1=109(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 109
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
