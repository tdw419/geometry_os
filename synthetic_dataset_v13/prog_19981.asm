; DESCRIPTION: Creates a purple circular shape at (272, 60) with radius 14.
; PLAN: r0=272(x), r1=60(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 60
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
