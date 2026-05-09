; DESCRIPTION: Places a orange circle of radius 66 at center (124, 104).
; PLAN: r0=124(x), r1=104(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 104
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
