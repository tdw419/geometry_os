; DESCRIPTION: Creates a black circular shape at (459, 57) with radius 28.
; PLAN: r0=459(x), r1=57(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 57
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
