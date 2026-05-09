; DESCRIPTION: Renders a black disk with center (96, 92) and radius 34.
; PLAN: r0=96(x), r1=92(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 92
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
