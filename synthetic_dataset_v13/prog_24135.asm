; DESCRIPTION: Places a yellow circle of radius 56 at center (430, 137).
; PLAN: r0=430(x), r1=137(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 137
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
