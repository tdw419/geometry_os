; DESCRIPTION: Draws a blue rectangle at (344, 19) with width 74 and height 49.
; PLAN: r0=344(x), r1=19(y), r2=74(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 19
LDI r2, 74
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
