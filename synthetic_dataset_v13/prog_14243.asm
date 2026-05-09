; DESCRIPTION: Creates a blue circular shape at (195, 99) with radius 74.
; PLAN: r0=195(x), r1=99(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 99
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
