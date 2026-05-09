; DESCRIPTION: Creates a orange circular shape at (145, 30) with radius 23.
; PLAN: r0=145(x), r1=30(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 30
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
