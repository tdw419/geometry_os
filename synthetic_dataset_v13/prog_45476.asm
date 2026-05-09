; DESCRIPTION: Creates a magenta circular shape at (366, 136) with radius 37.
; PLAN: r0=366(x), r1=136(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 136
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
