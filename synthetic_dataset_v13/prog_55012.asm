; DESCRIPTION: Creates a orange circular shape at (315, 81) with radius 30.
; PLAN: r0=315(x), r1=81(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 81
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
