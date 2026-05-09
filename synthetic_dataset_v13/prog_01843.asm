; DESCRIPTION: Creates a orange circular shape at (157, 50) with radius 40.
; PLAN: r0=157(x), r1=50(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 50
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
