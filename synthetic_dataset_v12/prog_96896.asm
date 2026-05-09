; DESCRIPTION: Renders a green disk with center (156, 200) and radius 24.
; PLAN: r0=156(x), r1=200(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 200
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
