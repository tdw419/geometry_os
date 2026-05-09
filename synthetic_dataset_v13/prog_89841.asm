; DESCRIPTION: Renders a black disk with center (40, 166) and radius 39.
; PLAN: r0=40(x), r1=166(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 166
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
