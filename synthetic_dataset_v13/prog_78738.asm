; DESCRIPTION: Places a green circle of radius 22 at center (334, 36).
; PLAN: r0=334(x), r1=36(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 36
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
