; DESCRIPTION: Renders a black disk with center (357, 171) and radius 72.
; PLAN: r0=357(x), r1=171(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 171
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
