; DESCRIPTION: Places a white circle of radius 21 at center (390, 104).
; PLAN: r0=390(x), r1=104(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 104
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
