; DESCRIPTION: Draws a orange circle centered at (44, 61) with radius 27.
; PLAN: r0=44(x), r1=61(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 61
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
