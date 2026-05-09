; DESCRIPTION: Renders a black disk with center (185, 57) and radius 43.
; PLAN: r0=185(x), r1=57(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 57
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
