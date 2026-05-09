; DESCRIPTION: Places a yellow circle of radius 49 at center (84, 145).
; PLAN: r0=84(x), r1=145(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 145
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
