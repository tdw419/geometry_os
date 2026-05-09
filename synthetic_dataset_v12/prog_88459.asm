; DESCRIPTION: Places a purple circle of radius 68 at center (286, 89).
; PLAN: r0=286(x), r1=89(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 89
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
