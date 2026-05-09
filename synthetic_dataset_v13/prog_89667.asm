; DESCRIPTION: Renders a black disk with center (299, 135) and radius 23.
; PLAN: r0=299(x), r1=135(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 135
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
