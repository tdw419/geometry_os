; DESCRIPTION: Creates a orange circular shape at (193, 153) with radius 36.
; PLAN: r0=193(x), r1=153(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 153
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
