; DESCRIPTION: Draws a orange circle centered at (176, 153) with radius 51.
; PLAN: r0=176(x), r1=153(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 153
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
