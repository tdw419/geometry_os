; DESCRIPTION: Draws a blue rectangle at (94, 68) with width 69 and height 37.
; PLAN: r0=94(x), r1=68(y), r2=69(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 68
LDI r2, 69
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
