; DESCRIPTION: Renders a magenta disk with center (350, 136) and radius 16.
; PLAN: r0=350(x), r1=136(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 136
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
