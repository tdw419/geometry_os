; DESCRIPTION: Places a yellow circle of radius 66 at center (430, 116).
; PLAN: r0=430(x), r1=116(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 116
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
