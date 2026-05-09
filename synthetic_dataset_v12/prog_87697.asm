; DESCRIPTION: Renders a black disk with center (161, 162) and radius 74.
; PLAN: r0=161(x), r1=162(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 162
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
