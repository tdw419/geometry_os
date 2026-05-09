; DESCRIPTION: Draws a purple circle centered at (252, 236) with radius 15.
; PLAN: r0=252(x), r1=236(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 236
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
