; DESCRIPTION: Creates a orange circular shape at (452, 93) with radius 22.
; PLAN: r0=452(x), r1=93(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 93
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
