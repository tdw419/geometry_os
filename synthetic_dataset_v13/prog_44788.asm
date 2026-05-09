; DESCRIPTION: Creates a purple circular shape at (424, 104) with radius 76.
; PLAN: r0=424(x), r1=104(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 104
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
