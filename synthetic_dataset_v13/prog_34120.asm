; DESCRIPTION: Places a white circle of radius 13 at center (388, 22).
; PLAN: r0=388(x), r1=22(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 22
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
