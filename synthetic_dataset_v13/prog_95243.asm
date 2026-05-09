; DESCRIPTION: Renders a magenta disk with center (29, 32) and radius 20.
; PLAN: r0=29(x), r1=32(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 32
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
