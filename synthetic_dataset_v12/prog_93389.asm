; DESCRIPTION: Renders a black disk with center (57, 113) and radius 17.
; PLAN: r0=57(x), r1=113(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 113
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
