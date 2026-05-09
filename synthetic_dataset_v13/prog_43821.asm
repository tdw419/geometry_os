; DESCRIPTION: Renders a green disk with center (359, 82) and radius 75.
; PLAN: r0=359(x), r1=82(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 82
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
