; DESCRIPTION: Renders a yellow disk with center (64, 174) and radius 64.
; PLAN: r0=64(x), r1=174(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 174
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
