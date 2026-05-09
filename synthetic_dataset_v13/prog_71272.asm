; DESCRIPTION: Draws a orange circle centered at (180, 108) with radius 63.
; PLAN: r0=180(x), r1=108(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 108
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
