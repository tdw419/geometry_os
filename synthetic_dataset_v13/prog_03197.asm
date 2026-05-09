; DESCRIPTION: Renders a green disk with center (377, 75) and radius 31.
; PLAN: r0=377(x), r1=75(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 75
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
