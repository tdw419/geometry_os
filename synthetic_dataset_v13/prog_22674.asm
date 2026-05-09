; DESCRIPTION: Renders a black disk with center (315, 141) and radius 71.
; PLAN: r0=315(x), r1=141(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 141
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
