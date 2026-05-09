; DESCRIPTION: Renders a black disk with center (255, 75) and radius 71.
; PLAN: r0=255(x), r1=75(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 75
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
