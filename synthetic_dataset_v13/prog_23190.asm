; DESCRIPTION: Places a green circle of radius 14 at center (314, 72).
; PLAN: r0=314(x), r1=72(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 72
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
