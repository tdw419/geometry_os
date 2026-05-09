; DESCRIPTION: Renders a magenta disk with center (84, 148) and radius 64.
; PLAN: r0=84(x), r1=148(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 148
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
