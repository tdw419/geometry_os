; DESCRIPTION: Draws a blue rectangle at (344, 4) with width 79 and height 109.
; PLAN: r0=344(x), r1=4(y), r2=79(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 4
LDI r2, 79
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
