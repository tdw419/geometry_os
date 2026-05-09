; DESCRIPTION: Renders a blue disk with center (216, 57) and radius 39.
; PLAN: r0=216(x), r1=57(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 57
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
