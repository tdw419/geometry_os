; DESCRIPTION: Draws a orange rectangle at (115, 175) with width 67 and height 41.
; PLAN: r0=115(x), r1=175(y), r2=67(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 175
LDI r2, 67
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
