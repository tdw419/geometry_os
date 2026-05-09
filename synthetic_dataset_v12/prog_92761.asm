; DESCRIPTION: Draws a purple circle centered at (260, 219) with radius 12.
; PLAN: r0=260(x), r1=219(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 219
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
