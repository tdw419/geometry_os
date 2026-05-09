; DESCRIPTION: Renders a black disk with center (254, 193) and radius 54.
; PLAN: r0=254(x), r1=193(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 193
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
