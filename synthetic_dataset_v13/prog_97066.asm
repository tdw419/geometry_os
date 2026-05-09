; DESCRIPTION: Creates a purple circular shape at (469, 213) with radius 13.
; PLAN: r0=469(x), r1=213(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 213
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
