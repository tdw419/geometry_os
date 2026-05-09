; DESCRIPTION: Draws a orange circle centered at (404, 163) with radius 25.
; PLAN: r0=404(x), r1=163(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 163
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
