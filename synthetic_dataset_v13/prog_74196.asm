; DESCRIPTION: Places a blue circle of radius 25 at center (314, 87).
; PLAN: r0=314(x), r1=87(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 87
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
