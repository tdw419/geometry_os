; DESCRIPTION: Creates a orange circular shape at (95, 132) with radius 18.
; PLAN: r0=95(x), r1=132(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 132
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
