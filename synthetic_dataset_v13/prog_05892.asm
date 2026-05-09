; DESCRIPTION: Draws a orange circle centered at (177, 147) with radius 50.
; PLAN: r0=177(x), r1=147(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 147
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
