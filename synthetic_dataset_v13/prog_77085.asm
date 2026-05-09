; DESCRIPTION: Places a white circle of radius 58 at center (60, 176).
; PLAN: r0=60(x), r1=176(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 176
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
