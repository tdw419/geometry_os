; DESCRIPTION: Places a white circle of radius 58 at center (314, 76).
; PLAN: r0=314(x), r1=76(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 76
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
