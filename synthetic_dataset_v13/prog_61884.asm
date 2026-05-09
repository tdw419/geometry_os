; DESCRIPTION: Renders a black disk with center (240, 159) and radius 44.
; PLAN: r0=240(x), r1=159(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 159
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
