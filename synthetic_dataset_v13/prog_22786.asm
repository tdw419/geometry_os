; DESCRIPTION: Places a yellow circle of radius 39 at center (324, 216).
; PLAN: r0=324(x), r1=216(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 216
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
