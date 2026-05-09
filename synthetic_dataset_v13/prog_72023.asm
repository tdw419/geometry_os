; DESCRIPTION: Renders a black disk with center (219, 176) and radius 52.
; PLAN: r0=219(x), r1=176(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 176
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
