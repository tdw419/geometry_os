; DESCRIPTION: Creates a orange circular shape at (482, 26) with radius 18.
; PLAN: r0=482(x), r1=26(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 26
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
