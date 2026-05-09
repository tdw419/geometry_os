; DESCRIPTION: Places a white circle of radius 15 at center (194, 217).
; PLAN: r0=194(x), r1=217(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 217
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
