; DESCRIPTION: Renders a black disk with center (145, 98) and radius 67.
; PLAN: r0=145(x), r1=98(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 98
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
