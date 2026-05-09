; DESCRIPTION: Renders a white disk with center (71, 131) and radius 44.
; PLAN: r0=71(x), r1=131(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 131
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
