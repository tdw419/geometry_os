; DESCRIPTION: Renders a black disk with center (353, 98) and radius 57.
; PLAN: r0=353(x), r1=98(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 98
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
