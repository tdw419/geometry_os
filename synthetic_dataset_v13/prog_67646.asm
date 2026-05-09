; DESCRIPTION: Draws a purple circle centered at (178, 145) with radius 38.
; PLAN: r0=178(x), r1=145(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 145
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
