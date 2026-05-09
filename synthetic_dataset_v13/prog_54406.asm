; DESCRIPTION: Renders a black disk with center (175, 195) and radius 29.
; PLAN: r0=175(x), r1=195(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 195
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
