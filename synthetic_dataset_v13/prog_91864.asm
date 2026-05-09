; DESCRIPTION: Places a yellow circle of radius 49 at center (361, 97).
; PLAN: r0=361(x), r1=97(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 97
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
