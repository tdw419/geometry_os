; DESCRIPTION: Places a yellow circle of radius 79 at center (310, 114).
; PLAN: r0=310(x), r1=114(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 114
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
