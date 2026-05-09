; DESCRIPTION: Places a yellow circle of radius 60 at center (325, 114).
; PLAN: r0=325(x), r1=114(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 114
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
