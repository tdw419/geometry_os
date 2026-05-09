; DESCRIPTION: Renders a green disk with center (35, 114) and radius 24.
; PLAN: r0=35(x), r1=114(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 114
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
