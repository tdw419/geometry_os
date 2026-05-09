; DESCRIPTION: Renders a yellow disk with center (88, 29) and radius 27.
; PLAN: r0=88(x), r1=29(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 29
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
