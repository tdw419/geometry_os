; DESCRIPTION: Renders a magenta disk with center (448, 169) and radius 54.
; PLAN: r0=448(x), r1=169(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 169
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
