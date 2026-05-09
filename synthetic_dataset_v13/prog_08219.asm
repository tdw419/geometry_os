; DESCRIPTION: Places a green circle of radius 72 at center (289, 140).
; PLAN: r0=289(x), r1=140(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 140
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
