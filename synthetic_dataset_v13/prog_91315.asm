; DESCRIPTION: Places a yellow circle of radius 77 at center (343, 81).
; PLAN: r0=343(x), r1=81(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 81
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
