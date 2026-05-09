; DESCRIPTION: Renders a yellow disk with center (161, 92) and radius 74.
; PLAN: r0=161(x), r1=92(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 92
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
