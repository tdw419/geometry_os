; DESCRIPTION: Draws a blue rectangle at (196, 203) with width 94 and height 36.
; PLAN: r0=196(x), r1=203(y), r2=94(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 203
LDI r2, 94
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
