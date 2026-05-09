; DESCRIPTION: Renders a green disk with center (204, 78) and radius 40.
; PLAN: r0=204(x), r1=78(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 78
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
