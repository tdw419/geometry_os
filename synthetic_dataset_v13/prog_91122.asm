; DESCRIPTION: Renders a magenta disk with center (180, 136) and radius 77.
; PLAN: r0=180(x), r1=136(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 136
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
