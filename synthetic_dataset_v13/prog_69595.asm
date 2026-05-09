; DESCRIPTION: Draws a orange circle centered at (100, 208) with radius 27.
; PLAN: r0=100(x), r1=208(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 208
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
