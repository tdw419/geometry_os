; DESCRIPTION: Places a white circle of radius 61 at center (273, 123).
; PLAN: r0=273(x), r1=123(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 123
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
