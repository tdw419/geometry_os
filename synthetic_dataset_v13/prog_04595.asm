; DESCRIPTION: Creates a orange circular shape at (407, 187) with radius 28.
; PLAN: r0=407(x), r1=187(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 187
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
