; DESCRIPTION: Creates a green circular shape at (432, 39) with radius 15.
; PLAN: r0=432(x), r1=39(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 39
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
