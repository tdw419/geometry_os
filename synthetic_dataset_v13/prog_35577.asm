; DESCRIPTION: Renders a green disk with center (204, 35) and radius 28.
; PLAN: r0=204(x), r1=35(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 35
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
