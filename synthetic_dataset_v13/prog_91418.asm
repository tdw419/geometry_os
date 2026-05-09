; DESCRIPTION: Draws a orange circle centered at (338, 104) with radius 58.
; PLAN: r0=338(x), r1=104(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 104
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
