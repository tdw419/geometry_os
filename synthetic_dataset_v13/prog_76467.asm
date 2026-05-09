; DESCRIPTION: Places a yellow circle of radius 58 at center (453, 110).
; PLAN: r0=453(x), r1=110(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 110
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
