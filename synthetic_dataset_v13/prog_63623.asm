; DESCRIPTION: Places a white circle of radius 14 at center (304, 30).
; PLAN: r0=304(x), r1=30(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 30
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
