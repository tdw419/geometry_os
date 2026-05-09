; DESCRIPTION: Renders a green disk with center (250, 125) and radius 37.
; PLAN: r0=250(x), r1=125(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 125
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
