; DESCRIPTION: Renders a black disk with center (100, 28) and radius 28.
; PLAN: r0=100(x), r1=28(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 28
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
