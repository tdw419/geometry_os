; DESCRIPTION: Creates a purple circular shape at (401, 104) with radius 74.
; PLAN: r0=401(x), r1=104(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 104
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
