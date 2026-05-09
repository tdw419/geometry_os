; DESCRIPTION: Creates a orange circular shape at (75, 67) with radius 43.
; PLAN: r0=75(x), r1=67(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 67
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
