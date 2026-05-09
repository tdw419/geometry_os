; DESCRIPTION: Creates a orange circular shape at (154, 110) with radius 60.
; PLAN: r0=154(x), r1=110(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 110
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
