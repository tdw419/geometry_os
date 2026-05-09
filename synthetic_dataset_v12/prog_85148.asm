; DESCRIPTION: Creates a orange circular shape at (188, 158) with radius 79.
; PLAN: r0=188(x), r1=158(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 158
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
