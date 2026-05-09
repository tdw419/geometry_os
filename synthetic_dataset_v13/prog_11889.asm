; DESCRIPTION: Places a yellow circle of radius 43 at center (89, 124).
; PLAN: r0=89(x), r1=124(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 124
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
