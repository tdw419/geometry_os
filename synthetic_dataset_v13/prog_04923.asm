; DESCRIPTION: Renders a black disk with center (161, 143) and radius 62.
; PLAN: r0=161(x), r1=143(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 143
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
