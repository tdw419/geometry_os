; DESCRIPTION: Creates a magenta circular shape at (41, 119) with radius 26.
; PLAN: r0=41(x), r1=119(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 119
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
