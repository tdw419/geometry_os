; DESCRIPTION: Renders a black disk with center (126, 86) and radius 11.
; PLAN: r0=126(x), r1=86(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 86
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
