; DESCRIPTION: Places a green circle of radius 72 at center (266, 85).
; PLAN: r0=266(x), r1=85(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 85
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
