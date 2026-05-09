; DESCRIPTION: Renders a black disk with center (49, 234) and radius 16.
; PLAN: r0=49(x), r1=234(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 234
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
