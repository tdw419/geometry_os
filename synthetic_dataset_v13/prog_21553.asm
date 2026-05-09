; DESCRIPTION: Draws a orange rectangle at (341, 25) with width 31 and height 115.
; PLAN: r0=341(x), r1=25(y), r2=31(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 25
LDI r2, 31
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
