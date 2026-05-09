; DESCRIPTION: Creates a orange circular shape at (203, 146) with radius 10.
; PLAN: r0=203(x), r1=146(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 146
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
