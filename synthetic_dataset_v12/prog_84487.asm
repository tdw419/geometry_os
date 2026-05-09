; DESCRIPTION: Renders a magenta disk with center (467, 170) and radius 28.
; PLAN: r0=467(x), r1=170(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 170
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
