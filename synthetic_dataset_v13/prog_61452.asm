; DESCRIPTION: Draws a orange circle centered at (95, 92) with radius 74.
; PLAN: r0=95(x), r1=92(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 92
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
