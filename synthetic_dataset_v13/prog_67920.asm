; DESCRIPTION: Creates a purple circular shape at (108, 66) with radius 21.
; PLAN: r0=108(x), r1=66(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 66
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
