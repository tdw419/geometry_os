; DESCRIPTION: Draws a green rectangle at (278, 121) with width 41 and height 85.
; PLAN: r0=278(x), r1=121(y), r2=41(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 121
LDI r2, 41
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
