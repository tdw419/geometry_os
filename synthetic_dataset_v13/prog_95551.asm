; DESCRIPTION: Draws a orange circle centered at (424, 126) with radius 13.
; PLAN: r0=424(x), r1=126(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 126
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
