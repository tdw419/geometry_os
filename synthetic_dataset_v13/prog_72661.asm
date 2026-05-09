; DESCRIPTION: Creates a orange circular shape at (40, 80) with radius 12.
; PLAN: r0=40(x), r1=80(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 80
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
