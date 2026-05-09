; DESCRIPTION: Places a white circle of radius 64 at center (438, 74).
; PLAN: r0=438(x), r1=74(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 74
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
