; DESCRIPTION: Creates a orange circular shape at (162, 178) with radius 25.
; PLAN: r0=162(x), r1=178(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 178
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
