; DESCRIPTION: Draws a orange circle centered at (480, 137) with radius 20.
; PLAN: r0=480(x), r1=137(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 137
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
