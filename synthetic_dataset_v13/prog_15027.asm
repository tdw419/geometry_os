; DESCRIPTION: Creates a purple circular shape at (270, 86) with radius 61.
; PLAN: r0=270(x), r1=86(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 86
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
