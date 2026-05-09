; DESCRIPTION: Draws a blue rectangle at (332, 68) with width 97 and height 83.
; PLAN: r0=332(x), r1=68(y), r2=97(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 68
LDI r2, 97
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
