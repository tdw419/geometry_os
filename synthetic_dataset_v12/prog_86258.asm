; DESCRIPTION: Creates a magenta circular shape at (364, 158) with radius 14.
; PLAN: r0=364(x), r1=158(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 158
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
