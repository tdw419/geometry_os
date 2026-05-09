; DESCRIPTION: Places a yellow circle of radius 23 at center (266, 188).
; PLAN: r0=266(x), r1=188(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 188
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
