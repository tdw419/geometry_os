; DESCRIPTION: Places a white circle of radius 40 at center (456, 60).
; PLAN: r0=456(x), r1=60(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 60
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
