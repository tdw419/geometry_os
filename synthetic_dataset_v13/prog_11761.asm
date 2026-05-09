; DESCRIPTION: Renders a black disk with center (237, 178) and radius 72.
; PLAN: r0=237(x), r1=178(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 178
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
