; DESCRIPTION: Draws a orange circle centered at (75, 98) with radius 67.
; PLAN: r0=75(x), r1=98(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 98
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
