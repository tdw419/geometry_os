; DESCRIPTION: Places a yellow circle of radius 15 at center (134, 131).
; PLAN: r0=134(x), r1=131(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 131
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
