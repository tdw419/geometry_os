; DESCRIPTION: Draws a orange circle centered at (424, 146) with radius 54.
; PLAN: r0=424(x), r1=146(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 146
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
