; DESCRIPTION: Renders a yellow disk with center (453, 157) and radius 32.
; PLAN: r0=453(x), r1=157(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 157
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
