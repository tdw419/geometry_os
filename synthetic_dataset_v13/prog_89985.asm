; DESCRIPTION: Places a white circle of radius 61 at center (225, 137).
; PLAN: r0=225(x), r1=137(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 137
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
