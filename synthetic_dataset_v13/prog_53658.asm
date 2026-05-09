; DESCRIPTION: Draws a orange rectangle at (246, 78) with width 29 and height 20.
; PLAN: r0=246(x), r1=78(y), r2=29(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 78
LDI r2, 29
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
