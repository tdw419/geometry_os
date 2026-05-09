; DESCRIPTION: Draws a orange circle centered at (338, 152) with radius 64.
; PLAN: r0=338(x), r1=152(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 152
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
