; DESCRIPTION: Renders a magenta disk with center (467, 99) and radius 30.
; PLAN: r0=467(x), r1=99(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 99
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
