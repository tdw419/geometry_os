; DESCRIPTION: Draws a red rectangle at (471, 41) with width 27 and height 77.
; PLAN: r0=471(x), r1=41(y), r2=27(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 41
LDI r2, 27
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
