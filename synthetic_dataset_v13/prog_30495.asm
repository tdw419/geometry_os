; DESCRIPTION: Creates a purple circular shape at (406, 132) with radius 77.
; PLAN: r0=406(x), r1=132(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 132
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
