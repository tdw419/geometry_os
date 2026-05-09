; DESCRIPTION: Draws a blue rectangle at (41, 72) with width 83 and height 37.
; PLAN: r0=41(x), r1=72(y), r2=83(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 72
LDI r2, 83
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
