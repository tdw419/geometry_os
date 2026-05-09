; DESCRIPTION: Creates a orange circular shape at (355, 94) with radius 63.
; PLAN: r0=355(x), r1=94(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 94
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
