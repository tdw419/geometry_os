; DESCRIPTION: Renders a white disk with center (93, 140) and radius 57.
; PLAN: r0=93(x), r1=140(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 140
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
