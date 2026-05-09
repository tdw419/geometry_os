; DESCRIPTION: Renders a blue disk with center (60, 109) and radius 39.
; PLAN: r0=60(x), r1=109(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 109
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
