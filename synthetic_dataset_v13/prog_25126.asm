; DESCRIPTION: Renders a black disk with center (123, 110) and radius 20.
; PLAN: r0=123(x), r1=110(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 110
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
