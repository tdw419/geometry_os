; DESCRIPTION: Places a yellow circle of radius 70 at center (211, 97).
; PLAN: r0=211(x), r1=97(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 97
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
