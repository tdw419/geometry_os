; DESCRIPTION: Creates a orange circular shape at (74, 134) with radius 26.
; PLAN: r0=74(x), r1=134(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 134
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
