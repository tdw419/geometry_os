; DESCRIPTION: Creates a orange circular shape at (164, 149) with radius 25.
; PLAN: r0=164(x), r1=149(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 149
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
