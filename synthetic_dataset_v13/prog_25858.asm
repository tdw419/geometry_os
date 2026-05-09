; DESCRIPTION: Creates a purple circular shape at (86, 195) with radius 35.
; PLAN: r0=86(x), r1=195(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 195
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
