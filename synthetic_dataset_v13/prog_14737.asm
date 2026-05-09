; DESCRIPTION: Draws a orange circle centered at (295, 192) with radius 25.
; PLAN: r0=295(x), r1=192(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 192
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
