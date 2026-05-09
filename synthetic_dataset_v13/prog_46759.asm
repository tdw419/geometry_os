; DESCRIPTION: Places a green circle of radius 11 at center (244, 106).
; PLAN: r0=244(x), r1=106(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 106
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
