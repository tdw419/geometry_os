; DESCRIPTION: Draws a blue rectangle at (213, 159) with width 67 and height 13.
; PLAN: r0=213(x), r1=159(y), r2=67(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 159
LDI r2, 67
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
