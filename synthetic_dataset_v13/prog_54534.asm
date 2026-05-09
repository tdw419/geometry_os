; DESCRIPTION: Places a green circle of radius 20 at center (155, 79).
; PLAN: r0=155(x), r1=79(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 79
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
