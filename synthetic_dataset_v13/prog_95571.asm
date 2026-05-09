; DESCRIPTION: Draws a orange rectangle at (163, 105) with width 27 and height 49.
; PLAN: r0=163(x), r1=105(y), r2=27(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 105
LDI r2, 27
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
