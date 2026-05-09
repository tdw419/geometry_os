; DESCRIPTION: Renders a magenta disk with center (282, 211) and radius 37.
; PLAN: r0=282(x), r1=211(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 211
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
