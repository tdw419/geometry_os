; DESCRIPTION: Renders a magenta disk with center (216, 128) and radius 79.
; PLAN: r0=216(x), r1=128(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 128
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
