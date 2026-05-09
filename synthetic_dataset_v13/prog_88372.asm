; DESCRIPTION: Places a white circle of radius 57 at center (83, 137).
; PLAN: r0=83(x), r1=137(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 137
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
