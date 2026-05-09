; DESCRIPTION: Creates a orange circular shape at (367, 58) with radius 22.
; PLAN: r0=367(x), r1=58(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 58
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
