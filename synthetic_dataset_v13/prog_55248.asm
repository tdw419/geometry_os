; DESCRIPTION: Draws a orange rectangle at (25, 113) with width 12 and height 118.
; PLAN: r0=25(x), r1=113(y), r2=12(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 113
LDI r2, 12
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
