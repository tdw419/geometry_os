; DESCRIPTION: Places a green circle of radius 34 at center (376, 124).
; PLAN: r0=376(x), r1=124(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 124
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
