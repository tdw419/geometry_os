; DESCRIPTION: Draws a blue rectangle at (86, 156) with width 41 and height 94.
; PLAN: r0=86(x), r1=156(y), r2=41(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 156
LDI r2, 41
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
