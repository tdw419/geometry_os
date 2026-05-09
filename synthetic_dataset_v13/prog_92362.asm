; DESCRIPTION: Draws a orange circle centered at (126, 57) with radius 37.
; PLAN: r0=126(x), r1=57(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 57
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
