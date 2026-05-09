; DESCRIPTION: Renders a magenta disk with center (329, 119) and radius 47.
; PLAN: r0=329(x), r1=119(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 119
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
