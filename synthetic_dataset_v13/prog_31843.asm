; DESCRIPTION: Draws a orange circle centered at (102, 186) with radius 57.
; PLAN: r0=102(x), r1=186(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 186
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
