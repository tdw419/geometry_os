; DESCRIPTION: Creates a orange circular shape at (179, 115) with radius 16.
; PLAN: r0=179(x), r1=115(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 115
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
