; DESCRIPTION: Places a yellow circle of radius 66 at center (287, 102).
; PLAN: r0=287(x), r1=102(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 102
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
