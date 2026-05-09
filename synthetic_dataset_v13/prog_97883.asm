; DESCRIPTION: Creates a magenta circular shape at (101, 85) with radius 35.
; PLAN: r0=101(x), r1=85(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 85
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
