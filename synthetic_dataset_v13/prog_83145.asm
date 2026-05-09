; DESCRIPTION: Places a yellow circle of radius 35 at center (112, 216).
; PLAN: r0=112(x), r1=216(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 216
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
