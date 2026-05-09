; DESCRIPTION: Places a white circle of radius 22 at center (64, 122).
; PLAN: r0=64(x), r1=122(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 122
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
