; DESCRIPTION: Places a green circle of radius 78 at center (129, 160).
; PLAN: r0=129(x), r1=160(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 160
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
