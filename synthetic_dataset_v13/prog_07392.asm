; DESCRIPTION: Places a green circle of radius 79 at center (359, 156).
; PLAN: r0=359(x), r1=156(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 156
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
