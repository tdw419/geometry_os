; DESCRIPTION: Draws a red rectangle at (342, 106) with width 107 and height 41.
; PLAN: r0=342(x), r1=106(y), r2=107(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 106
LDI r2, 107
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
