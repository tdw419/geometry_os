; DESCRIPTION: Places a yellow circle of radius 61 at center (238, 109).
; PLAN: r0=238(x), r1=109(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 109
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
