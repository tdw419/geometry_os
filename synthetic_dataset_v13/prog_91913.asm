; DESCRIPTION: Places a yellow circle of radius 12 at center (495, 227).
; PLAN: r0=495(x), r1=227(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 495
LDI r1, 227
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
