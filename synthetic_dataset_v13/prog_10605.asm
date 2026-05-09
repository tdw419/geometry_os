; DESCRIPTION: Creates a black circular shape at (193, 122) with radius 52.
; PLAN: r0=193(x), r1=122(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 122
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
