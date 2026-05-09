; DESCRIPTION: Creates a orange circular shape at (335, 200) with radius 28.
; PLAN: r0=335(x), r1=200(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 200
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
