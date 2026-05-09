; DESCRIPTION: Draws a red rectangle at (55, 7) with width 85 and height 41.
; PLAN: r0=55(x), r1=7(y), r2=85(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 7
LDI r2, 85
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
