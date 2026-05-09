; DESCRIPTION: Draws a orange circle centered at (126, 58) with radius 46.
; PLAN: r0=126(x), r1=58(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 58
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
