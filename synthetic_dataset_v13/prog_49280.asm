; DESCRIPTION: Creates a blue circular shape at (120, 156) with radius 75.
; PLAN: r0=120(x), r1=156(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 156
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
