; DESCRIPTION: Renders a black disk with center (74, 100) and radius 73.
; PLAN: r0=74(x), r1=100(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 100
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
