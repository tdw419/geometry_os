; DESCRIPTION: Places a yellow circle of radius 61 at center (289, 106).
; PLAN: r0=289(x), r1=106(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 106
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
