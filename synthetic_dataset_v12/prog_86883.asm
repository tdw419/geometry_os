; DESCRIPTION: Renders a black disk with center (312, 194) and radius 46.
; PLAN: r0=312(x), r1=194(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 194
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
