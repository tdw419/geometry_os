; DESCRIPTION: Renders a blue disk with center (159, 182) and radius 69.
; PLAN: r0=159(x), r1=182(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 182
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
