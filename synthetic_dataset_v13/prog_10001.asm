; DESCRIPTION: Places a white circle of radius 73 at center (339, 132).
; PLAN: r0=339(x), r1=132(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 132
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
