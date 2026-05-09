; DESCRIPTION: Places a white circle of radius 13 at center (222, 25).
; PLAN: r0=222(x), r1=25(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 25
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
