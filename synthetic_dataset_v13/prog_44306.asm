; DESCRIPTION: Creates a blue circular shape at (399, 104) with radius 55.
; PLAN: r0=399(x), r1=104(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 104
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
