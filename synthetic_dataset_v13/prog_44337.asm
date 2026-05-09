; DESCRIPTION: Draws a blue rectangle at (158, 67) with width 79 and height 75.
; PLAN: r0=158(x), r1=67(y), r2=79(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 67
LDI r2, 79
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
