; DESCRIPTION: Places a yellow circle of radius 21 at center (99, 188).
; PLAN: r0=99(x), r1=188(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 188
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
