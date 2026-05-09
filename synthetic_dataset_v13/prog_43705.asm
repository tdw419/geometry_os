; DESCRIPTION: Places a yellow circle of radius 77 at center (109, 105).
; PLAN: r0=109(x), r1=105(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 105
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
