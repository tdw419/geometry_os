; DESCRIPTION: Places a green circle of radius 70 at center (137, 105).
; PLAN: r0=137(x), r1=105(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 105
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
