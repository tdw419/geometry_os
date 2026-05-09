; DESCRIPTION: Draws a blue rectangle at (263, 67) with width 20 and height 107.
; PLAN: r0=263(x), r1=67(y), r2=20(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 67
LDI r2, 20
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
