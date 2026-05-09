; DESCRIPTION: Creates a orange circular shape at (450, 119) with radius 53.
; PLAN: r0=450(x), r1=119(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 119
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
