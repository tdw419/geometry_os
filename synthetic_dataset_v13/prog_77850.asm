; DESCRIPTION: Creates a purple circular shape at (28, 156) with radius 28.
; PLAN: r0=28(x), r1=156(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 156
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
