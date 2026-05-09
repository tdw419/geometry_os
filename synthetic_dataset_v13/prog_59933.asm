; DESCRIPTION: Renders a black disk with center (118, 213) and radius 37.
; PLAN: r0=118(x), r1=213(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 213
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
