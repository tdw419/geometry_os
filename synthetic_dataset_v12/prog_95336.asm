; DESCRIPTION: Renders a green disk with center (68, 72) and radius 17.
; PLAN: r0=68(x), r1=72(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 72
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
