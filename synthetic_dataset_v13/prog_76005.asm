; DESCRIPTION: Draws a red rectangle at (41, 90) with width 88 and height 70.
; PLAN: r0=41(x), r1=90(y), r2=88(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 90
LDI r2, 88
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
