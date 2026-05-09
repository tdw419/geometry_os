; DESCRIPTION: Creates a purple circular shape at (421, 70) with radius 39.
; PLAN: r0=421(x), r1=70(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 70
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
