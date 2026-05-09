; DESCRIPTION: Draws a blue rectangle at (292, 97) with width 68 and height 22.
; PLAN: r0=292(x), r1=97(y), r2=68(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 97
LDI r2, 68
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
