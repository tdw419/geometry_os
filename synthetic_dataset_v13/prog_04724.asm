; DESCRIPTION: Renders a black disk with center (353, 141) and radius 46.
; PLAN: r0=353(x), r1=141(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 141
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
