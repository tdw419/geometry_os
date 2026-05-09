; DESCRIPTION: Places a blue circle of radius 56 at center (289, 133).
; PLAN: r0=289(x), r1=133(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 133
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
