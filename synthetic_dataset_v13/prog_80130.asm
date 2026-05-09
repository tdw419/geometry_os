; DESCRIPTION: Creates a orange circular shape at (366, 145) with radius 28.
; PLAN: r0=366(x), r1=145(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 145
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
