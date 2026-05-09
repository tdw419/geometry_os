; DESCRIPTION: Places a white circle of radius 31 at center (76, 152).
; PLAN: r0=76(x), r1=152(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 152
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
