; DESCRIPTION: Places a green circle of radius 79 at center (166, 80).
; PLAN: r0=166(x), r1=80(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 80
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
