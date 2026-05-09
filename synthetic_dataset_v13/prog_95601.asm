; DESCRIPTION: Draws a blue rectangle at (232, 42) with width 43 and height 67.
; PLAN: r0=232(x), r1=42(y), r2=43(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 42
LDI r2, 43
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
