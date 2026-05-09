; DESCRIPTION: Draws a red rectangle at (395, 96) with width 115 and height 41.
; PLAN: r0=395(x), r1=96(y), r2=115(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 96
LDI r2, 115
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
