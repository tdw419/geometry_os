; DESCRIPTION: Places a orange circle of radius 75 at center (407, 147).
; PLAN: r0=407(x), r1=147(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 147
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
