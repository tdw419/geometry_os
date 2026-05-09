; DESCRIPTION: Creates a orange circular shape at (286, 178) with radius 65.
; PLAN: r0=286(x), r1=178(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 178
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
