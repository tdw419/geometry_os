; DESCRIPTION: Renders a blue disk with center (338, 159) and radius 53.
; PLAN: r0=338(x), r1=159(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 159
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
