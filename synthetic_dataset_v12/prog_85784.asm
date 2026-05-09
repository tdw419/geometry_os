; DESCRIPTION: Draws a orange rectangle at (266, 143) with width 69 and height 75.
; PLAN: r0=266(x), r1=143(y), r2=69(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 143
LDI r2, 69
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
