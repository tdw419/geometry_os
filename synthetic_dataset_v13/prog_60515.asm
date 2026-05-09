; DESCRIPTION: Draws a orange circle centered at (99, 182) with radius 46.
; PLAN: r0=99(x), r1=182(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 182
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
