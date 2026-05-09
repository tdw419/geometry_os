; DESCRIPTION: Renders a green disk with center (292, 151) and radius 26.
; PLAN: r0=292(x), r1=151(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 151
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
