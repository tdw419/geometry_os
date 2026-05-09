; DESCRIPTION: Renders a black disk with center (353, 40) and radius 28.
; PLAN: r0=353(x), r1=40(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 40
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
