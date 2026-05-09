; DESCRIPTION: Draws a orange rectangle at (221, 174) with width 116 and height 41.
; PLAN: r0=221(x), r1=174(y), r2=116(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 174
LDI r2, 116
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
