; DESCRIPTION: Draws a orange circle centered at (186, 111) with radius 66.
; PLAN: r0=186(x), r1=111(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 111
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
