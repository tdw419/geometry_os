; DESCRIPTION: Places a white circle of radius 18 at center (189, 33).
; PLAN: r0=189(x), r1=33(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 33
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
