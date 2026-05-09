; DESCRIPTION: Draws a orange circle centered at (297, 152) with radius 44.
; PLAN: r0=297(x), r1=152(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 152
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
