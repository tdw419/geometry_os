; DESCRIPTION: Draws a orange circle centered at (116, 179) with radius 28.
; PLAN: r0=116(x), r1=179(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 179
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
