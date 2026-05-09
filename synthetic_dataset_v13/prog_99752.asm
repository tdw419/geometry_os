; DESCRIPTION: Draws a orange circle centered at (145, 93) with radius 30.
; PLAN: r0=145(x), r1=93(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 93
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
