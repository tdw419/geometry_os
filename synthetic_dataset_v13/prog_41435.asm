; DESCRIPTION: Places a blue circle of radius 29 at center (314, 83).
; PLAN: r0=314(x), r1=83(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 83
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
