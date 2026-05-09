; DESCRIPTION: Draws a orange circle centered at (206, 111) with radius 61.
; PLAN: r0=206(x), r1=111(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 111
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
