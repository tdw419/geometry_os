; DESCRIPTION: Draws a purple circle centered at (318, 95) with radius 47.
; PLAN: r0=318(x), r1=95(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 95
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
