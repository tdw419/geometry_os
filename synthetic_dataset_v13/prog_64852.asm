; DESCRIPTION: Places a yellow circle of radius 20 at center (137, 34).
; PLAN: r0=137(x), r1=34(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 34
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
