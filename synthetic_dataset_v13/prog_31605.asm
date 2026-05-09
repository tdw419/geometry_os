; DESCRIPTION: Places a white circle of radius 10 at center (157, 39).
; PLAN: r0=157(x), r1=39(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 39
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
