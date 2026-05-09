; DESCRIPTION: Draws a orange circle centered at (278, 146) with radius 35.
; PLAN: r0=278(x), r1=146(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 146
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
