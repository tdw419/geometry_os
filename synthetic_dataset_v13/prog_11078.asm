; DESCRIPTION: Draws a red rectangle at (84, 13) with width 38 and height 41.
; PLAN: r0=84(x), r1=13(y), r2=38(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 13
LDI r2, 38
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
