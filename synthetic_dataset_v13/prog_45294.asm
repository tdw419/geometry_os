; DESCRIPTION: Draws a blue rectangle at (344, 213) with width 100 and height 41.
; PLAN: r0=344(x), r1=213(y), r2=100(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 213
LDI r2, 100
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
