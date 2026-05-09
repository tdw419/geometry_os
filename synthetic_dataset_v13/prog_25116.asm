; DESCRIPTION: Draws a purple circle centered at (185, 50) with radius 22.
; PLAN: r0=185(x), r1=50(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 50
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
