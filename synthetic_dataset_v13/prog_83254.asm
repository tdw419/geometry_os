; DESCRIPTION: Draws a orange circle centered at (117, 124) with radius 29.
; PLAN: r0=117(x), r1=124(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 124
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
