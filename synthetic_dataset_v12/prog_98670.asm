; DESCRIPTION: Places a white circle of radius 26 at center (60, 100).
; PLAN: r0=60(x), r1=100(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 100
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
