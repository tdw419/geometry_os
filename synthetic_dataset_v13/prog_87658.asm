; DESCRIPTION: Creates a purple circular shape at (86, 154) with radius 75.
; PLAN: r0=86(x), r1=154(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 154
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
