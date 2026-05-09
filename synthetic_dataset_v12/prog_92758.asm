; DESCRIPTION: Draws a orange circle centered at (470, 198) with radius 27.
; PLAN: r0=470(x), r1=198(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 198
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
