; DESCRIPTION: Places a blue circle of radius 44 at center (335, 58).
; PLAN: r0=335(x), r1=58(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 58
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
