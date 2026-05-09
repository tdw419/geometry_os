; DESCRIPTION: Draws a purple circle centered at (357, 104) with radius 14.
; PLAN: r0=357(x), r1=104(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 104
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
