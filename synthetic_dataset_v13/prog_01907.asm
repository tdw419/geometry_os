; DESCRIPTION: Draws a orange rectangle at (49, 75) with width 71 and height 94.
; PLAN: r0=49(x), r1=75(y), r2=71(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 75
LDI r2, 71
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
