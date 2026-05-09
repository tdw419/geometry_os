; DESCRIPTION: Creates a black circular shape at (212, 65) with radius 57.
; PLAN: r0=212(x), r1=65(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 65
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
