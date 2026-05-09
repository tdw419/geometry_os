; DESCRIPTION: Places a blue circle of radius 44 at center (336, 98).
; PLAN: r0=336(x), r1=98(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 98
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
