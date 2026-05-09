; DESCRIPTION: Renders a blue disk with center (158, 139) and radius 42.
; PLAN: r0=158(x), r1=139(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 139
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
