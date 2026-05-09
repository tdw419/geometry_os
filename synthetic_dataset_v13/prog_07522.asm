; DESCRIPTION: Renders a green disk with center (453, 162) and radius 17.
; PLAN: r0=453(x), r1=162(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 162
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
