; DESCRIPTION: Places a yellow circle of radius 33 at center (115, 217).
; PLAN: r0=115(x), r1=217(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 217
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
