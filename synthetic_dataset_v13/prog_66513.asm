; DESCRIPTION: Draws a orange circle centered at (220, 137) with radius 80.
; PLAN: r0=220(x), r1=137(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 137
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
