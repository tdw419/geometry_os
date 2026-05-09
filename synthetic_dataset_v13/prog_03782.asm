; DESCRIPTION: Draws a orange circle centered at (408, 35) with radius 27.
; PLAN: r0=408(x), r1=35(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 35
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
