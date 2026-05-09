; DESCRIPTION: Places a yellow circle of radius 61 at center (390, 132).
; PLAN: r0=390(x), r1=132(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 132
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
