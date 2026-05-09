; DESCRIPTION: Renders a black disk with center (420, 75) and radius 49.
; PLAN: r0=420(x), r1=75(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 75
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
