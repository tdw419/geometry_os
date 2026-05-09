; DESCRIPTION: Renders a black disk with center (430, 87) and radius 48.
; PLAN: r0=430(x), r1=87(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 87
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
