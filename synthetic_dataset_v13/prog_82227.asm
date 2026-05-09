; DESCRIPTION: Renders a black disk with center (172, 161) and radius 47.
; PLAN: r0=172(x), r1=161(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 161
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
