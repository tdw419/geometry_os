; DESCRIPTION: Places a white circle of radius 22 at center (107, 217).
; PLAN: r0=107(x), r1=217(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 217
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
