; DESCRIPTION: Draws a orange circle centered at (70, 195) with radius 27.
; PLAN: r0=70(x), r1=195(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 195
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
