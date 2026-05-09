; DESCRIPTION: Renders a magenta disk with center (162, 155) and radius 70.
; PLAN: r0=162(x), r1=155(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 155
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
