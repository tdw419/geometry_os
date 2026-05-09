; DESCRIPTION: Draws a purple circle centered at (374, 160) with radius 69.
; PLAN: r0=374(x), r1=160(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 160
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
