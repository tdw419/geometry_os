; DESCRIPTION: Creates a orange circular shape at (103, 102) with radius 77.
; PLAN: r0=103(x), r1=102(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 102
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
