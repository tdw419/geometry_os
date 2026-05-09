; DESCRIPTION: Draws a purple circle centered at (250, 87) with radius 67.
; PLAN: r0=250(x), r1=87(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 87
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
