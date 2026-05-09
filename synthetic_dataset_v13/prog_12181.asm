; DESCRIPTION: Places a white circle of radius 57 at center (200, 114).
; PLAN: r0=200(x), r1=114(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 114
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
