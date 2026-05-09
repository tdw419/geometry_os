; DESCRIPTION: Places a blue circle of radius 72 at center (251, 99).
; PLAN: r0=251(x), r1=99(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 99
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
