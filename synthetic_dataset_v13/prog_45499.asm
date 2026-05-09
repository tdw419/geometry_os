; DESCRIPTION: Creates a orange circular shape at (114, 79) with radius 58.
; PLAN: r0=114(x), r1=79(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 79
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
