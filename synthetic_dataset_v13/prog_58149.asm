; DESCRIPTION: Renders a black disk with center (268, 125) and radius 47.
; PLAN: r0=268(x), r1=125(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 125
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
