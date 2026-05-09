; DESCRIPTION: Draws a orange rectangle at (67, 114) with width 43 and height 50.
; PLAN: r0=67(x), r1=114(y), r2=43(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 114
LDI r2, 43
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
