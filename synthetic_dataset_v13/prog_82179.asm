; DESCRIPTION: Creates a orange circular shape at (428, 148) with radius 55.
; PLAN: r0=428(x), r1=148(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 148
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
