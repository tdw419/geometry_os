; DESCRIPTION: Renders a black disk with center (109, 70) and radius 10.
; PLAN: r0=109(x), r1=70(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 70
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
