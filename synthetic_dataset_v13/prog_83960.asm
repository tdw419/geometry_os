; DESCRIPTION: Places a blue circle of radius 66 at center (289, 106).
; PLAN: r0=289(x), r1=106(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 106
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
