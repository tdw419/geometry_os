; DESCRIPTION: Creates a black circular shape at (84, 34) with radius 27.
; PLAN: r0=84(x), r1=34(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 34
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
