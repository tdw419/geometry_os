; DESCRIPTION: Places a yellow circle of radius 11 at center (421, 115).
; PLAN: r0=421(x), r1=115(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 115
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
