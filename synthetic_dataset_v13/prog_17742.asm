; DESCRIPTION: Places a white circle of radius 35 at center (162, 72).
; PLAN: r0=162(x), r1=72(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 72
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
