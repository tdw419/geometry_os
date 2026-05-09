; DESCRIPTION: Draws a blue rectangle at (430, 41) with width 57 and height 68.
; PLAN: r0=430(x), r1=41(y), r2=57(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 41
LDI r2, 57
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
