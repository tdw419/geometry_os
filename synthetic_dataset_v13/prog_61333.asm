; DESCRIPTION: Places a yellow circle of radius 44 at center (468, 81).
; PLAN: r0=468(x), r1=81(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 81
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
