; DESCRIPTION: Renders a magenta disk with center (216, 50) and radius 39.
; PLAN: r0=216(x), r1=50(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 50
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
