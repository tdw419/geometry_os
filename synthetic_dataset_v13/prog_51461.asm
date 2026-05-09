; DESCRIPTION: Places a white circle of radius 38 at center (438, 76).
; PLAN: r0=438(x), r1=76(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 76
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
