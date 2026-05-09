; DESCRIPTION: Creates a black circular shape at (276, 121) with radius 56.
; PLAN: r0=276(x), r1=121(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 121
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
