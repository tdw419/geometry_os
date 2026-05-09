; DESCRIPTION: Places a green circle of radius 14 at center (78, 199).
; PLAN: r0=78(x), r1=199(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 199
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
