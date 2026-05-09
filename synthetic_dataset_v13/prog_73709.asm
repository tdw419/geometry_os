; DESCRIPTION: Places a yellow circle of radius 31 at center (324, 87).
; PLAN: r0=324(x), r1=87(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 87
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
