; DESCRIPTION: Renders a black disk with center (254, 108) and radius 52.
; PLAN: r0=254(x), r1=108(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 108
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
