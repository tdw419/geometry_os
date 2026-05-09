; DESCRIPTION: Draws a orange rectangle at (362, 41) with width 114 and height 113.
; PLAN: r0=362(x), r1=41(y), r2=114(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 41
LDI r2, 114
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
