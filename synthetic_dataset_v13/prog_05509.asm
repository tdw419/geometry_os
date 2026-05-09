; DESCRIPTION: Creates a orange circular shape at (353, 66) with radius 40.
; PLAN: r0=353(x), r1=66(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 66
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
