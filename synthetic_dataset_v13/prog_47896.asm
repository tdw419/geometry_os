; DESCRIPTION: Draws a orange circle centered at (77, 186) with radius 13.
; PLAN: r0=77(x), r1=186(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 186
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
