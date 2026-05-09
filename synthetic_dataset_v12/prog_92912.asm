; DESCRIPTION: Draws a red rectangle at (1, 173) with width 96 and height 41.
; PLAN: r0=1(x), r1=173(y), r2=96(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 173
LDI r2, 96
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
