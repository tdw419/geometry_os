; DESCRIPTION: Places a yellow circle of radius 15 at center (87, 102).
; PLAN: r0=87(x), r1=102(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 102
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
