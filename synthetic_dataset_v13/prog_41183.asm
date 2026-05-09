; DESCRIPTION: Renders a black disk with center (213, 72) and radius 53.
; PLAN: r0=213(x), r1=72(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 72
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
