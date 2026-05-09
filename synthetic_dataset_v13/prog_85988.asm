; DESCRIPTION: Renders a magenta disk with center (307, 216) and radius 22.
; PLAN: r0=307(x), r1=216(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 216
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
