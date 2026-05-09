; DESCRIPTION: Creates a purple circular shape at (191, 132) with radius 75.
; PLAN: r0=191(x), r1=132(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 132
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
