; DESCRIPTION: Renders a blue disk with center (466, 53) and radius 39.
; PLAN: r0=466(x), r1=53(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 53
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
