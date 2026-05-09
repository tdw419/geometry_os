; DESCRIPTION: Places a yellow circle of radius 72 at center (366, 73).
; PLAN: r0=366(x), r1=73(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 73
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
