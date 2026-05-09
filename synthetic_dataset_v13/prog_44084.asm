; DESCRIPTION: Draws a red rectangle at (432, 71) with width 18 and height 70.
; PLAN: r0=432(x), r1=71(y), r2=18(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 71
LDI r2, 18
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
