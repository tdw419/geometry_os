; DESCRIPTION: Renders a black disk with center (432, 135) and radius 72.
; PLAN: r0=432(x), r1=135(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 135
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
