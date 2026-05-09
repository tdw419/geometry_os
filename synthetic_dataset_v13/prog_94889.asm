; DESCRIPTION: Creates a purple circular shape at (355, 104) with radius 63.
; PLAN: r0=355(x), r1=104(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 104
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
