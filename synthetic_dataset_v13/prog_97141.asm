; DESCRIPTION: Creates a purple circular shape at (236, 66) with radius 52.
; PLAN: r0=236(x), r1=66(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 66
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
