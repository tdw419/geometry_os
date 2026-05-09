; DESCRIPTION: Renders a black disk with center (137, 166) and radius 44.
; PLAN: r0=137(x), r1=166(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 166
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
