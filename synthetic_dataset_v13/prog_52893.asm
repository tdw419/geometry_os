; DESCRIPTION: Creates a orange circular shape at (249, 159) with radius 19.
; PLAN: r0=249(x), r1=159(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 159
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
