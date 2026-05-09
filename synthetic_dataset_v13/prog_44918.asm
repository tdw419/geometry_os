; DESCRIPTION: Creates a orange circular shape at (425, 75) with radius 16.
; PLAN: r0=425(x), r1=75(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 75
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
