; DESCRIPTION: Creates a orange circular shape at (333, 87) with radius 69.
; PLAN: r0=333(x), r1=87(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 87
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
