; DESCRIPTION: Creates a orange circular shape at (288, 99) with radius 68.
; PLAN: r0=288(x), r1=99(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 99
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
