; DESCRIPTION: Draws a orange circle centered at (234, 63) with radius 27.
; PLAN: r0=234(x), r1=63(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 63
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
