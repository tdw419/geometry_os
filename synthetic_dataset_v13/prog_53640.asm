; DESCRIPTION: Renders a black disk with center (161, 193) and radius 43.
; PLAN: r0=161(x), r1=193(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 193
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
