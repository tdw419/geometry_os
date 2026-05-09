; DESCRIPTION: Draws a purple circle centered at (222, 95) with radius 38.
; PLAN: r0=222(x), r1=95(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 95
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
