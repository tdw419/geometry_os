; DESCRIPTION: Places a yellow circle of radius 21 at center (81, 22).
; PLAN: r0=81(x), r1=22(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 22
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
