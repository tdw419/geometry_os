; DESCRIPTION: Creates a orange circular shape at (245, 103) with radius 66.
; PLAN: r0=245(x), r1=103(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 103
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
