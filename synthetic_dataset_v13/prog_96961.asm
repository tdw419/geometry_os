; DESCRIPTION: Draws a green rectangle at (96, 41) with width 50 and height 85.
; PLAN: r0=96(x), r1=41(y), r2=50(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 41
LDI r2, 50
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
