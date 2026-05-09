; DESCRIPTION: Creates a orange circular shape at (355, 73) with radius 61.
; PLAN: r0=355(x), r1=73(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 73
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
