; DESCRIPTION: Draws a blue rectangle at (28, 66) with width 67 and height 11.
; PLAN: r0=28(x), r1=66(y), r2=67(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 66
LDI r2, 67
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
