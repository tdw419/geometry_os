; DESCRIPTION: Draws a orange rectangle at (344, 116) with width 69 and height 35.
; PLAN: r0=344(x), r1=116(y), r2=69(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 116
LDI r2, 69
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
