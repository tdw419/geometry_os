; DESCRIPTION: Renders a yellow disk with center (90, 88) and radius 56.
; PLAN: r0=90(x), r1=88(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 88
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
