; DESCRIPTION: Renders a black disk with center (335, 187) and radius 64.
; PLAN: r0=335(x), r1=187(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 187
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
