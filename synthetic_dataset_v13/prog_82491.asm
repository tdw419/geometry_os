; DESCRIPTION: Draws a blue rectangle at (196, 81) with width 96 and height 67.
; PLAN: r0=196(x), r1=81(y), r2=96(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 81
LDI r2, 96
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
