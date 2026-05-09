; DESCRIPTION: Draws a orange circle centered at (297, 217) with radius 32.
; PLAN: r0=297(x), r1=217(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 217
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
