; DESCRIPTION: Creates a orange circular shape at (290, 121) with radius 76.
; PLAN: r0=290(x), r1=121(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 121
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
