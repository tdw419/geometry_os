; DESCRIPTION: Draws a purple circle centered at (169, 128) with radius 79.
; PLAN: r0=169(x), r1=128(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 128
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
