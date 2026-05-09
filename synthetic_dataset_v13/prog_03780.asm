; DESCRIPTION: Draws a orange rectangle at (391, 123) with width 67 and height 43.
; PLAN: r0=391(x), r1=123(y), r2=67(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 123
LDI r2, 67
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
