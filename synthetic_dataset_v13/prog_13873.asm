; DESCRIPTION: Places a yellow circle of radius 58 at center (423, 191).
; PLAN: r0=423(x), r1=191(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 191
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
