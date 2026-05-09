; DESCRIPTION: Places a yellow circle of radius 40 at center (366, 110).
; PLAN: r0=366(x), r1=110(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 110
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
