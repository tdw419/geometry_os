; DESCRIPTION: Renders a magenta disk with center (255, 216) and radius 19.
; PLAN: r0=255(x), r1=216(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 216
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
