; DESCRIPTION: Renders a magenta disk with center (22, 149) and radius 22.
; PLAN: r0=22(x), r1=149(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 149
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
