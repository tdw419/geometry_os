; DESCRIPTION: Renders a green disk with center (365, 106) and radius 23.
; PLAN: r0=365(x), r1=106(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 106
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
