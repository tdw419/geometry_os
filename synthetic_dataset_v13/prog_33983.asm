; DESCRIPTION: Creates a magenta circular shape at (136, 110) with radius 52.
; PLAN: r0=136(x), r1=110(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 110
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
