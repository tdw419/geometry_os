; DESCRIPTION: Draws a purple circle centered at (469, 77) with radius 22.
; PLAN: r0=469(x), r1=77(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 77
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
