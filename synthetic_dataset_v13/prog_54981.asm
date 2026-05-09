; DESCRIPTION: Renders a magenta disk with center (270, 216) and radius 17.
; PLAN: r0=270(x), r1=216(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 216
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
