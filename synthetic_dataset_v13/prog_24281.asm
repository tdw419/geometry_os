; DESCRIPTION: Renders a green disk with center (115, 117) and radius 39.
; PLAN: r0=115(x), r1=117(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 117
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
