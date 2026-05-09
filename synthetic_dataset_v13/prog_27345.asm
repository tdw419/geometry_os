; DESCRIPTION: Renders a green disk with center (289, 153) and radius 61.
; PLAN: r0=289(x), r1=153(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 153
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
