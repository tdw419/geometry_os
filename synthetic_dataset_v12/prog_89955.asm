; DESCRIPTION: Creates a orange circular shape at (275, 165) with radius 70.
; PLAN: r0=275(x), r1=165(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 165
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
