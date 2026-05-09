; DESCRIPTION: Creates a black circular shape at (128, 124) with radius 70.
; PLAN: r0=128(x), r1=124(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 124
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
