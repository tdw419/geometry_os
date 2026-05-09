; DESCRIPTION: Draws a red rectangle at (182, 3) with width 31 and height 41.
; PLAN: r0=182(x), r1=3(y), r2=31(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 3
LDI r2, 31
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
