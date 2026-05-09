; DESCRIPTION: Renders a green disk with center (453, 171) and radius 37.
; PLAN: r0=453(x), r1=171(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 171
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
