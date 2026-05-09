; DESCRIPTION: Renders a black disk with center (36, 234) and radius 21.
; PLAN: r0=36(x), r1=234(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 234
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
