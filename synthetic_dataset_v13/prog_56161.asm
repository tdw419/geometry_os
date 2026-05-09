; DESCRIPTION: Places a white circle of radius 66 at center (323, 124).
; PLAN: r0=323(x), r1=124(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 124
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
