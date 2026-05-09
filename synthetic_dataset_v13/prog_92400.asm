; DESCRIPTION: Draws a purple circle centered at (278, 144) with radius 38.
; PLAN: r0=278(x), r1=144(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 144
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
