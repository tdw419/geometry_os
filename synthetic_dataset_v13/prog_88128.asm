; DESCRIPTION: Draws a orange circle centered at (339, 152) with radius 75.
; PLAN: r0=339(x), r1=152(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 152
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
