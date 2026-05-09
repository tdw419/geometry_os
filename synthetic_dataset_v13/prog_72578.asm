; DESCRIPTION: Renders a blue disk with center (360, 114) and radius 14.
; PLAN: r0=360(x), r1=114(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 114
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
