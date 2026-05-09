; DESCRIPTION: Places a white circle of radius 10 at center (366, 217).
; PLAN: r0=366(x), r1=217(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 217
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
