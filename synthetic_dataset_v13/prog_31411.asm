; DESCRIPTION: Renders a black disk with center (22, 25) and radius 20.
; PLAN: r0=22(x), r1=25(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 25
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
