; DESCRIPTION: Renders a purple disk with center (461, 204) and radius 43.
; PLAN: r0=461(x), r1=204(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 204
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
