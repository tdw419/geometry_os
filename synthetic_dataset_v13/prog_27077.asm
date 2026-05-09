; DESCRIPTION: Places a white circle of radius 18 at center (157, 76).
; PLAN: r0=157(x), r1=76(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 76
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
