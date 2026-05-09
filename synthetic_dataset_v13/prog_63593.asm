; DESCRIPTION: Places a white circle of radius 61 at center (104, 170).
; PLAN: r0=104(x), r1=170(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 170
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
