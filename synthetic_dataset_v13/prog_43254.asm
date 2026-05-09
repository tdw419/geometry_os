; DESCRIPTION: Draws a red rectangle at (50, 158) with width 41 and height 44.
; PLAN: r0=50(x), r1=158(y), r2=41(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 158
LDI r2, 41
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
