; DESCRIPTION: Renders a black disk with center (237, 88) and radius 79.
; PLAN: r0=237(x), r1=88(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 88
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
