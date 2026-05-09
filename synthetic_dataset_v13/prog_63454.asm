; DESCRIPTION: Draws a orange rectangle at (260, 113) with width 105 and height 12.
; PLAN: r0=260(x), r1=113(y), r2=105(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 113
LDI r2, 105
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
