; DESCRIPTION: Creates a black circular shape at (222, 57) with radius 39.
; PLAN: r0=222(x), r1=57(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 57
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
