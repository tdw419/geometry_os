; DESCRIPTION: Renders a blue disk with center (312, 93) and radius 60.
; PLAN: r0=312(x), r1=93(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 93
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
