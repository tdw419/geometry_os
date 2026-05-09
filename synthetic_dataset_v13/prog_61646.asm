; DESCRIPTION: Renders a yellow disk with center (76, 78) and radius 68.
; PLAN: r0=76(x), r1=78(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 78
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
