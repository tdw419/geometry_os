; DESCRIPTION: Places a yellow circle of radius 35 at center (430, 64).
; PLAN: r0=430(x), r1=64(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 64
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
