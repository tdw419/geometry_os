; DESCRIPTION: Places a green circle of radius 40 at center (129, 152).
; PLAN: r0=129(x), r1=152(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 152
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
