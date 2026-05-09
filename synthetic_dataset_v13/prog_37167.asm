; DESCRIPTION: Draws a orange rectangle at (6, 96) with width 55 and height 113.
; PLAN: r0=6(x), r1=96(y), r2=55(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 96
LDI r2, 55
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
