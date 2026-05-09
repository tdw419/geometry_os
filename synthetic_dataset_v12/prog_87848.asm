; DESCRIPTION: Places a yellow circle of radius 66 at center (286, 109).
; PLAN: r0=286(x), r1=109(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 109
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
