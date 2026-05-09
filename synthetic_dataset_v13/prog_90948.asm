; DESCRIPTION: Creates a orange circular shape at (489, 41) with radius 13.
; PLAN: r0=489(x), r1=41(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 489
LDI r1, 41
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
