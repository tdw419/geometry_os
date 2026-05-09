; DESCRIPTION: Renders a magenta disk with center (196, 136) and radius 61.
; PLAN: r0=196(x), r1=136(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 136
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
