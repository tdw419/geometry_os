; DESCRIPTION: Renders a black disk with center (276, 195) and radius 57.
; PLAN: r0=276(x), r1=195(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 195
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
