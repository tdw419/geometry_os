; DESCRIPTION: Draws a orange circle centered at (311, 104) with radius 27.
; PLAN: r0=311(x), r1=104(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 104
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
