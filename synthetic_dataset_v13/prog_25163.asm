; DESCRIPTION: Creates a black circular shape at (493, 158) with radius 11.
; PLAN: r0=493(x), r1=158(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 493
LDI r1, 158
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
