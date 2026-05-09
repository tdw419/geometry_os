; DESCRIPTION: Draws a orange rectangle at (370, 116) with width 43 and height 74.
; PLAN: r0=370(x), r1=116(y), r2=43(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 116
LDI r2, 43
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
