; DESCRIPTION: Renders a magenta disk with center (448, 56) and radius 20.
; PLAN: r0=448(x), r1=56(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 56
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
