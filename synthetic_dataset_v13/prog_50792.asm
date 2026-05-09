; DESCRIPTION: Renders a black disk with center (276, 84) and radius 47.
; PLAN: r0=276(x), r1=84(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 84
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
