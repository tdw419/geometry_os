; DESCRIPTION: Draws a red rectangle at (313, 144) with width 41 and height 62.
; PLAN: r0=313(x), r1=144(y), r2=41(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 144
LDI r2, 41
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
