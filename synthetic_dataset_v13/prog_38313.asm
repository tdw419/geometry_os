; DESCRIPTION: Renders a black disk with center (85, 80) and radius 72.
; PLAN: r0=85(x), r1=80(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 80
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
