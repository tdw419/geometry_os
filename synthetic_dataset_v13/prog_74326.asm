; DESCRIPTION: Places a green circle of radius 72 at center (83, 112).
; PLAN: r0=83(x), r1=112(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 112
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
