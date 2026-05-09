; DESCRIPTION: Places a blue circle of radius 34 at center (83, 44).
; PLAN: r0=83(x), r1=44(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 44
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
