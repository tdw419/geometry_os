; DESCRIPTION: Renders a black disk with center (61, 161) and radius 48.
; PLAN: r0=61(x), r1=161(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 161
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
