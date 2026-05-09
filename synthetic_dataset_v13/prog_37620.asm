; DESCRIPTION: Places a white circle of radius 61 at center (258, 70).
; PLAN: r0=258(x), r1=70(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 70
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
