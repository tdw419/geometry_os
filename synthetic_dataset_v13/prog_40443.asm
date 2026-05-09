; DESCRIPTION: Draws a blue rectangle at (344, 103) with width 75 and height 73.
; PLAN: r0=344(x), r1=103(y), r2=75(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 103
LDI r2, 75
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
