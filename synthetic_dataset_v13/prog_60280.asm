; DESCRIPTION: Renders a blue disk with center (317, 159) and radius 66.
; PLAN: r0=317(x), r1=159(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 159
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
