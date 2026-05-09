; DESCRIPTION: Draws a orange rectangle at (415, 162) with width 39 and height 41.
; PLAN: r0=415(x), r1=162(y), r2=39(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 162
LDI r2, 39
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
