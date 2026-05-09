; DESCRIPTION: Places a yellow circle of radius 14 at center (399, 139).
; PLAN: r0=399(x), r1=139(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 139
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
