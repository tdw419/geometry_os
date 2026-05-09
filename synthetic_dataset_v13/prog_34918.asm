; DESCRIPTION: Renders a purple disk with center (206, 140) and radius 44.
; PLAN: r0=206(x), r1=140(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 140
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
