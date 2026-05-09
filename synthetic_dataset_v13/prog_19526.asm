; DESCRIPTION: Draws a orange circle centered at (394, 152) with radius 58.
; PLAN: r0=394(x), r1=152(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 152
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
