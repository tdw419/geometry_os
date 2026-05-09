; DESCRIPTION: Places a white circle of radius 70 at center (112, 162).
; PLAN: r0=112(x), r1=162(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 162
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
