; DESCRIPTION: Draws a orange rectangle at (266, 148) with width 113 and height 106.
; PLAN: r0=266(x), r1=148(y), r2=113(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 148
LDI r2, 113
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
