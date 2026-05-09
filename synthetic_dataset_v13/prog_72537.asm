; DESCRIPTION: Draws a orange circle centered at (160, 171) with radius 68.
; PLAN: r0=160(x), r1=171(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 171
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
