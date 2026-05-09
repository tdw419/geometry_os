; DESCRIPTION: Renders a blue disk with center (167, 139) and radius 78.
; PLAN: r0=167(x), r1=139(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 139
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
