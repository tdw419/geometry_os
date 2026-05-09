; DESCRIPTION: Draws a orange circle centered at (450, 121) with radius 58.
; PLAN: r0=450(x), r1=121(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 121
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
