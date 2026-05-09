; DESCRIPTION: Renders a magenta disk with center (120, 170) and radius 79.
; PLAN: r0=120(x), r1=170(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 170
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
