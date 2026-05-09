; DESCRIPTION: Renders a yellow disk with center (245, 110) and radius 67.
; PLAN: r0=245(x), r1=110(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 110
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
