; DESCRIPTION: Renders a magenta disk with center (359, 112) and radius 17.
; PLAN: r0=359(x), r1=112(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 112
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
