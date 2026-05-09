; DESCRIPTION: Draws a red rectangle at (261, 10) with width 95 and height 41.
; PLAN: r0=261(x), r1=10(y), r2=95(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 10
LDI r2, 95
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
