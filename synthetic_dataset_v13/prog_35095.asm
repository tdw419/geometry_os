; DESCRIPTION: Draws a blue rectangle at (216, 97) with width 74 and height 97.
; PLAN: r0=216(x), r1=97(y), r2=74(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 97
LDI r2, 74
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
