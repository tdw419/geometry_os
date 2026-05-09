; DESCRIPTION: Renders a white disk with center (382, 114) and radius 60.
; PLAN: r0=382(x), r1=114(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 114
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
