; DESCRIPTION: Places a yellow circle of radius 15 at center (139, 124).
; PLAN: r0=139(x), r1=124(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 124
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
