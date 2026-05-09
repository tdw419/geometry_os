; DESCRIPTION: Places a green circle of radius 62 at center (283, 94).
; PLAN: r0=283(x), r1=94(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 94
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
