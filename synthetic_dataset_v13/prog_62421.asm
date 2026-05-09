; DESCRIPTION: Creates a orange circular shape at (119, 74) with radius 49.
; PLAN: r0=119(x), r1=74(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 74
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
