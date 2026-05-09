; DESCRIPTION: Places a white circle of radius 29 at center (104, 51).
; PLAN: r0=104(x), r1=51(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 51
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
