; DESCRIPTION: Renders a white disk with center (301, 114) and radius 17.
; PLAN: r0=301(x), r1=114(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 114
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
