; DESCRIPTION: Creates a orange circular shape at (184, 162) with radius 80.
; PLAN: r0=184(x), r1=162(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 162
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
