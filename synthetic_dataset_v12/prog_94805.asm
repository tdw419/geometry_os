; DESCRIPTION: Renders a magenta disk with center (230, 87) and radius 78.
; PLAN: r0=230(x), r1=87(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 87
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
