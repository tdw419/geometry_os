; DESCRIPTION: Draws a orange rectangle at (306, 113) with width 96 and height 79.
; PLAN: r0=306(x), r1=113(y), r2=96(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 113
LDI r2, 96
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
