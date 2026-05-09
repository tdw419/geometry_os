; DESCRIPTION: Renders a magenta disk with center (251, 37) and radius 15.
; PLAN: r0=251(x), r1=37(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 37
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
