; DESCRIPTION: Creates a black circular shape at (187, 178) with radius 74.
; PLAN: r0=187(x), r1=178(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 178
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
