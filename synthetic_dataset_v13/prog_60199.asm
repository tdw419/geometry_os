; DESCRIPTION: Places a blue circle of radius 40 at center (314, 170).
; PLAN: r0=314(x), r1=170(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 170
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
