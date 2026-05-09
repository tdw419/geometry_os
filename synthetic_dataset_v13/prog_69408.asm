; DESCRIPTION: Renders a black disk with center (219, 40) and radius 25.
; PLAN: r0=219(x), r1=40(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 40
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
