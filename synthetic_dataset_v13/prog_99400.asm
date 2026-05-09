; DESCRIPTION: Draws a orange circle centered at (286, 152) with radius 50.
; PLAN: r0=286(x), r1=152(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 152
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
