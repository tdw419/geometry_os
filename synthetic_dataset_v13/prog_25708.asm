; DESCRIPTION: Renders a blue disk with center (74, 140) and radius 72.
; PLAN: r0=74(x), r1=140(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 140
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
