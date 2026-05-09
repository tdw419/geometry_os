; DESCRIPTION: Creates a orange circular shape at (253, 91) with radius 50.
; PLAN: r0=253(x), r1=91(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 91
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
