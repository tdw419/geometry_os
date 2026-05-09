; DESCRIPTION: Renders a yellow disk with center (484, 105) and radius 14.
; PLAN: r0=484(x), r1=105(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 484
LDI r1, 105
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
