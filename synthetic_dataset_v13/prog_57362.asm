; DESCRIPTION: Places a green circle of radius 14 at center (250, 156).
; PLAN: r0=250(x), r1=156(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 156
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
