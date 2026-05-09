; DESCRIPTION: Renders a black disk with center (92, 95) and radius 53.
; PLAN: r0=92(x), r1=95(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 95
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
