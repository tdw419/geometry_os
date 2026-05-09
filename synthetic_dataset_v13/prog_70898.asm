; DESCRIPTION: Creates a black circular shape at (493, 106) with radius 15.
; PLAN: r0=493(x), r1=106(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 493
LDI r1, 106
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
