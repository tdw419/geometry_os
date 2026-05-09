; DESCRIPTION: Draws a purple circle centered at (412, 87) with radius 80.
; PLAN: r0=412(x), r1=87(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 87
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
