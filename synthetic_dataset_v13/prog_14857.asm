; DESCRIPTION: Places a green circle of radius 23 at center (65, 136).
; PLAN: r0=65(x), r1=136(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 136
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
