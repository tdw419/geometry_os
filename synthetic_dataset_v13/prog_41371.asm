; DESCRIPTION: Creates a black circular shape at (187, 161) with radius 57.
; PLAN: r0=187(x), r1=161(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 161
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
