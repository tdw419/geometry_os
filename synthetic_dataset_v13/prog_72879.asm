; DESCRIPTION: Draws a orange circle centered at (198, 212) with radius 14.
; PLAN: r0=198(x), r1=212(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 212
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
