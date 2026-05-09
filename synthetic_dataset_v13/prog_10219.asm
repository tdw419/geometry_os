; DESCRIPTION: Places a white circle of radius 57 at center (409, 170).
; PLAN: r0=409(x), r1=170(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 170
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
