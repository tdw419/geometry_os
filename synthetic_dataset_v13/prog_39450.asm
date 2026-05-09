; DESCRIPTION: Creates a magenta circular shape at (463, 119) with radius 40.
; PLAN: r0=463(x), r1=119(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 119
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
